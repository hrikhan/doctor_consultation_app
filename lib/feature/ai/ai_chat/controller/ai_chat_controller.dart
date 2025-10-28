import 'package:doctor_consultation/feature/ai/ai_chat/data/demo_responses.dart';
import 'package:doctor_consultation/feature/ai/ai_chat/model/chat_message.dart';
import 'package:doctor_consultation/feature/home/main_screen/controller/home_screen_controller.dart';
import 'package:doctor_consultation/feature/home/main_screen/model/doctor_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AIChatController extends GetxController {
  final TextEditingController composerController = TextEditingController();
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  late final HomeScreenController _homeController;
  final ScrollController scrollController = ScrollController();
  final ImagePicker _imagePicker = ImagePicker();
  final RxnString selectedImagePath = RxnString();

  @override
  void onInit() {
    super.onInit();
    _homeController = Get.isRegistered<HomeScreenController>()
        ? Get.find<HomeScreenController>()
        : Get.put(HomeScreenController(), permanent: true);
  }

  void sendMessage() {
    final imagePath = selectedImagePath.value;
    final text = composerController.text.trim();
    if (text.isEmpty && imagePath == null) return;

    if (imagePath != null) {
      messages.add(
        ChatMessage.userImage(
          imagePath,
          caption: text.isEmpty ? null : text,
          isLocal: true,
        ),
      );
      selectedImagePath.value = null;
    } else {
      messages.add(ChatMessage.userText(text));
    }

    _scrollToBottom();
    composerController.clear();

    if (text.isNotEmpty) {
      final ChatMessage aiResponse = _buildAIResponse(text);
      _enqueueAIResponse(aiResponse);
    } else {
      _enqueueAIResponse(
        ChatMessage.aiText(
          'Image received. I\'ll analyse and get back with details soon.',
        ),
      );
    }
  }

  Future<void> pickImage() async {
    final XFile? pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile == null) return;

    selectedImagePath.value = pickedFile.path;
  }

  void clearSelectedImage() {
    selectedImagePath.value = null;
  }

  void startNewChat() {
    messages.clear();
    composerController.clear();
    selectedImagePath.value = null;
    _scrollToBottom();
  }

  Future<void> _enqueueAIResponse(
    ChatMessage response, {
    Duration delay = const Duration(milliseconds: 1200),
  }) async {
    final ChatMessage typingMessage = ChatMessage.aiTyping();
    messages.add(typingMessage);
    _scrollToBottom();

    await Future.delayed(delay);

    messages.remove(typingMessage);
    messages.add(response);

    _scrollToBottom();
  }

  ChatMessage _buildAIResponse(String text) {
    final lower = text.toLowerCase();
    AIResponseTemplate? template;
    for (final candidate in demoResponseTemplates) {
      if (candidate.matches(lower)) {
        template = candidate;
        break;
      }
    }

    if (template != null) {
      DoctorSuggestion? suggestion;
      if (template.isCritical) {
        final specialty = template.suggestedSpecialty ?? 'specialist';
        final doctors = template.suggestedSpecialty != null
            ? _homeController.allDoctors
                .where(
                  (doctor) => doctor.specialty
                      .toLowerCase()
                      .contains(specialty.toLowerCase()),
                )
                .take(2)
                .toList()
            : <Doctor>[];

        suggestion = DoctorSuggestion(specialty: specialty, doctors: doctors);
      }

      return ChatMessage.aiText(
        template.response,
        isCritical: template.isCritical,
        suggestion: suggestion,
      );
    }

    return ChatMessage.aiText(defaultAIResponse);
  }

  void _scrollToBottom() {
    if (!scrollController.hasClients) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!scrollController.hasClients) return;
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void onClose() {
    composerController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}

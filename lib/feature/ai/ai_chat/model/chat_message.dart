import 'package:doctor_consultation/feature/home/main_screen/model/doctor_list_model.dart';

enum ChatSender { user, ai }

enum MessageType { text, image }

class DoctorSuggestion {
  DoctorSuggestion({required this.specialty, required this.doctors});

  final String specialty;
  final List<Doctor> doctors;
}

class ChatMessage {
  ChatMessage._({
    required this.sender,
    required this.type,
    this.text,
    this.imageUrl,
    this.isLocalImage = false,
    this.isCritical = false,
    this.suggestion,
    this.isTyping = false,
  });

  factory ChatMessage.userText(String text) => ChatMessage._(
    sender: ChatSender.user,
    type: MessageType.text,
    text: text,
  );

  factory ChatMessage.userImage(
    String imageUrl, {
    String? caption,
    bool isLocal = false,
  }) => ChatMessage._(
    sender: ChatSender.user,
    type: MessageType.image,
    imageUrl: imageUrl,
    text: caption,
    isLocalImage: isLocal,
  );

  factory ChatMessage.aiText(
    String text, {
    bool isCritical = false,
    DoctorSuggestion? suggestion,
  }) => ChatMessage._(
    sender: ChatSender.ai,
    type: MessageType.text,
    text: text,
    isCritical: isCritical,
    suggestion: suggestion,
  );

  factory ChatMessage.aiTyping() => ChatMessage._(
    sender: ChatSender.ai,
    type: MessageType.text,
    isTyping: true,
  );

  final ChatSender sender;
  final MessageType type;
  final String? text;
  final String? imageUrl;
  final bool isLocalImage;
  final bool isCritical;
  final DoctorSuggestion? suggestion;
  final bool isTyping;
}

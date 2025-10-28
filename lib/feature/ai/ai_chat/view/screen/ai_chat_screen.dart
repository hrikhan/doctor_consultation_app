import 'package:doctor_consultation/feature/ai/ai_chat/controller/ai_chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/chat_bubble.dart';
import '../widgets/chat_composer.dart';
import '../widgets/header_button.dart';

class AIChatScreen extends StatelessWidget {
  AIChatScreen({super.key});

  final AIChatController controller = Get.put(AIChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        controller: controller.scrollController,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) {
                          final message = controller.messages[index];
                          return ChatBubble(message: message);
                        },
                      ),
                    ),
                  ),
                ),
                ChatComposer(controller: controller),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeaderButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    label: 'Back',
                    onTap: () => Get.back(),
                  ),
                  HeaderButton(
                    icon: Icons.chat_bubble_outline,
                    label: 'New Chat',
                    onTap: controller.startNewChat,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

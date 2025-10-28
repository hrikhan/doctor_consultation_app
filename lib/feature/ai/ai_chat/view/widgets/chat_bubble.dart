import 'dart:io';

import 'package:doctor_consultation/core/utils/app_colors.dart';
import 'package:doctor_consultation/feature/ai/ai_chat/model/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'critical_note.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    if (message.isTyping) {
      return const _TypingIndicatorBubble();
    }

    final bool isUser = message.sender == ChatSender.user;
    final Alignment alignment = isUser
        ? Alignment.centerRight
        : Alignment.centerLeft;
    final Color bubbleColor = isUser
        ? Colors.black.withValues(alpha: 0.85)
        : Colors.white.withValues(alpha: 0.95);
    final BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(16.r),
      topRight: Radius.circular(16.r),
      bottomLeft: Radius.circular(isUser ? 16.r : 4.r),
      bottomRight: Radius.circular(isUser ? 4.r : 16.r),
    );

    final bool hasCaption = message.text?.trim().isNotEmpty ?? false;

    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 0.78.sw),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: borderRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(14.w),
              child: Column(
                crossAxisAlignment: isUser
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  if (message.type == MessageType.image)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: message.isLocalImage
                          ? Image.file(
                              File(message.imageUrl ?? ''),
                              height: 220.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              message.imageUrl ?? '',
                              height: 220.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                    ),
                  if (message.type == MessageType.text || hasCaption)
                    Padding(
                      padding: message.type == MessageType.image
                          ? EdgeInsets.only(top: 12.h)
                          : EdgeInsets.zero,
                      child: Text(
                        message.text ?? '',
                        style: TextStyle(
                          color: isUser
                              ? Colors.white
                              : AppColors.textPrimary.withValues(alpha: 0.9),
                          fontSize: 16.sp,
                          height: 1.4,
                        ),
                      ),
                    ),
                  if (message.isCritical && message.suggestion != null)
                    Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: CriticalNote(suggestion: message.suggestion!),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TypingIndicatorBubble extends StatefulWidget {
  const _TypingIndicatorBubble();

  @override
  State<_TypingIndicatorBubble> createState() => _TypingIndicatorBubbleState();
}

class _TypingIndicatorBubbleState extends State<_TypingIndicatorBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _dotAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
    _dotAnimations = List.generate(3, (index) {
      final double start = index * 0.2;
      final double end = start + 0.6;
      return CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end > 1.0 ? 1.0 : end, curve: Curves.easeInOut),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.95),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
              bottomLeft: Radius.circular(4.r),
              bottomRight: Radius.circular(16.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: FadeTransition(
                    opacity: _dotAnimations[index],
                    child: ScaleTransition(
                      scale: _dotAnimations[index],
                      child: Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

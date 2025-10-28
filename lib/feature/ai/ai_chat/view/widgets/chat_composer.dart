import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/ai_chat_controller.dart';

class ChatComposer extends StatelessWidget {
  const ChatComposer({super.key, required this.controller});

  final AIChatController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selectedImagePath = controller.selectedImagePath.value;
      return Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.deepOrange.withValues(alpha: 0.2),
              blurRadius: 18,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (selectedImagePath != null)
              _SelectedImagePreview(
                imagePath: selectedImagePath,
                onRemove: controller.clearSelectedImage,
              ),
            Row(
              children: [
                IconButton(
                  onPressed: controller.pickImage,
                  icon: Icon(
                    Icons.image_outlined,
                    color: Colors.deepOrangeAccent,
                    size: 28.sp,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: TextField(
                      controller: controller.composerController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Describe your symptoms...',
                      ),
                      minLines: 1,
                      maxLines: 4,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                GestureDetector(
                  onTap: controller.sendMessage,
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepOrange,
                          Colors.redAccent,
                          Colors.orangeAccent,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepOrange.withValues(alpha: 0.35),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(Icons.send, color: Colors.white, size: 20.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class _SelectedImagePreview extends StatelessWidget {
  const _SelectedImagePreview({
    required this.imagePath,
    required this.onRemove,
  });

  final String imagePath;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Image.file(
              File(imagePath),
              height: 150.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: GestureDetector(
                onTap: onRemove,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(6.w),
                  child: Icon(Icons.close, color: Colors.white, size: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

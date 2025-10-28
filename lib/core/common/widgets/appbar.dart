import 'package:doctor_consultation/core/common/style/textstyle.dart';
import 'package:doctor_consultation/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarWithSearch extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final IconData? actionIcon;
  final VoidCallback? onActionPressed;

  const CustomAppBarWithSearch({
    super.key,
    required this.title,
    required this.subtitle,
    this.actionIcon,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h, // enough for title + subtitle + search bar
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // AppBar background
          Container(
            height: 120.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, Colors.tealAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.r),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 40.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + Subtitle
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GetTextStyle.heading(color: Colors.white),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subtitle,
                      style: GetTextStyle.subtitle(color: Colors.white70),
                    ),
                  ],
                ),
                if (actionIcon != null)
                  IconButton(
                    icon: Icon(actionIcon, size: 28.sp, color: Colors.white),
                    onPressed: onActionPressed,
                  ),
              ],
            ),
          ),

          // Search bar positioned overlapping the bottom of AppBar
          Positioned(
            bottom: 0,
            left: 16.w,
            right: 16.w,
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppColors.primary, size: 24.sp),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      style: GetTextStyle.body(),
                      decoration: InputDecoration(
                        hintText: "Search doctor, specialty...",
                        hintStyle: GetTextStyle.subtitle(),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150.h);
}

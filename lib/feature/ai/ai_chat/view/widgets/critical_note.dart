import 'package:doctor_consultation/core/utils/app_colors.dart';
import 'package:doctor_consultation/feature/ai/ai_chat/model/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doctor_tile.dart';

class CriticalNote extends StatelessWidget {
  const CriticalNote({super.key, required this.suggestion});

  final DoctorSuggestion suggestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orangeAccent.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.35)),
      ),
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: AppColors.error,
                size: 18.sp,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'This looks critical. Please see a ${suggestion.specialty}.',
                  style: TextStyle(
                    color: AppColors.error,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            'Suggested doctors',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
            ),
          ),
          if (suggestion.doctors.isEmpty)
            Padding(
              padding: EdgeInsets.only(top: 6.h),
              child: Text(
                'No doctors available at the moment. Please try again later.',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12.sp,
                ),
              ),
            )
          else
            ...suggestion.doctors.map(
              (doctor) => Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: DoctorTile(doctor: doctor),
              ),
            ),
        ],
      ),
    );
  }
}

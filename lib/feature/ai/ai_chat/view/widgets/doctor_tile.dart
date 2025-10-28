import 'package:doctor_consultation/core/utils/app_colors.dart';
import 'package:doctor_consultation/feature/home/main_screen/model/doctor_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorTile extends StatelessWidget {
  const DoctorTile({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18.r,
          backgroundImage: NetworkImage(doctor.imageUrl),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.local_hospital,
                    size: 14.sp,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      doctor.specialty,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.call, color: AppColors.primary, size: 18.sp),
        ),
      ],
    );
  }
}

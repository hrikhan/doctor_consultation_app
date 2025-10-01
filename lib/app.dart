import 'package:doctor_consultation/core/utils/theme.dart';
import 'package:doctor_consultation/feature/bottom_navbar/view/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorApp extends StatelessWidget {
  const DoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      home: BottomNavbar(),
    );
  }
}

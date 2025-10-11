import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GetTextStyle {
  // Heading style
  static TextStyle heading({
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.black,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Subtitle style
  static TextStyle subtitle({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w500,
    Color color = Colors.grey,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Body text style
  static TextStyle body({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black87,
  }) {
    return GoogleFonts.lato(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Button text style
  static TextStyle button({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.white,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }
}

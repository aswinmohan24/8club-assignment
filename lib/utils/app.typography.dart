import 'package:eight_club_test/utils/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText {
  // Headings
  static TextStyle get h2Bold => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.text1,
  );

  static TextStyle get h3regular => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.text5,
  );
  static TextStyle get h3regularWhite => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static TextStyle get h3regularr => TextStyle(
    fontSize: 19.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.text5,
  );

  // Body
  static TextStyle get body2Regukar => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.text1,
  );
  static TextStyle get body2RegularLow => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.text3,
  );

  static TextStyle get body1Regular => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.text1,
  );

  static TextStyle get s1Regukar => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.text5,
  );
}

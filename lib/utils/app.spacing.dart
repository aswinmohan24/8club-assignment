import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacing {
  // Vertical Spacing
  static double get hx4 => 4.h;
  static double get hx8 => 8.h;
  static double get hx12 => 12.h;
  static double get hx16 => 16.h;
  static double get hx20 => 20.h;
  static double get hx24 => 24.h;

  // Horizontal Spacing
  static double get w4 => 4.w;
  static double get w8 => 8.w;
  static double get w12 => 12.w;
  static double get w16 => 16.w;
  static double get w20 => 20.w;
  static double get wx24 => 24.w;

  static EdgeInsets get screenPadding => EdgeInsets.symmetric(horizontal: 20.w);

  static SizedBox get gapXs => SizedBox(height: hx4);
  static SizedBox get gapSm => SizedBox(height: hx8);
  static SizedBox get gapMd => SizedBox(height: hx12);
  static SizedBox get gapLg => SizedBox(height: hx16);
  static SizedBox get gapXl => SizedBox(height: hx20);
  static SizedBox get gapXxl => SizedBox(height: hx24);
}

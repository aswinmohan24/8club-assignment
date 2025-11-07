import 'dart:ui';
import 'package:eight_club_test/core/extensions.dart';
import 'package:eight_club_test/utils/app.colors.dart';
import 'package:eight_club_test/utils/app.spacing.dart';
import 'package:eight_club_test/utils/app.typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: context.width(),
            height: 56.h,
            constraints: BoxConstraints(maxHeight: 56.h, minHeight: 56.h),
            decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
          ),
        ),

        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.white.withAlpha(15)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Next", style: AppText.body1Regular),
            SizedBox(width: AppSpacing.w8),
            SvgPicture.asset(
              "assets/svg/Vector.svg",
              width: 14.w,
              height: 14.h,
            ),
          ],
        ),
      ],
    );
  }
}

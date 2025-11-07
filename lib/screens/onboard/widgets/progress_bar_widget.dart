import 'package:eight_club_test/core/common/widgets/spiral_progress.dart';
import 'package:eight_club_test/core/extensions.dart';
import 'package:eight_club_test/utils/app.colors.dart' show AppColors;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProgressBarWidget extends StatelessWidget {
  final int fillValue;
  const ProgressBarWidget({super.key, required this.fillValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      height: 100.h,
      decoration: BoxDecoration(color: AppColors.progressBg),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 40.h, 16.w, 24.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/svg/arrow-left.svg",
              width: 20.w,
              height: 20.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 30.w, right: 20.w, top: 5.h),
                child: SpiralProgress(
                  showPurple: true,
                  fillValue: fillValue,
                  duration: Duration(milliseconds: 200),
                ),
              ),
            ),
            SvgPicture.asset("assets/svg/x.svg", width: 20.w, height: 20.h),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpiralProgress extends StatelessWidget {
  final bool showPurple; // when true, purple fades in
  final Duration duration;
  final int fillValue;

  const SpiralProgress({
    super.key,
    required this.showPurple,
    this.duration = const Duration(milliseconds: 600),
    required this.fillValue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28, // match design
      child: Stack(
        // fit: StackFit.expand,
        children: [
          // Base (light gray) - always visible
          SvgPicture.asset(
            'assets/svg/wave_base.svg',
            fit: BoxFit.fitWidth,
            height: 8.h,
          ),

          // Purple (fades in)
          AnimatedOpacity(
            duration: duration,
            curve: Curves.easeOut,
            opacity: showPurple ? 1 : 0,
            child: SvgPicture.asset(
              'assets/svg/wave_fill.svg',

              fit: BoxFit.contain,
              height: 8.h,
            ),
          ),

          fillValue >= 2
              ? AnimatedOpacity(
                  duration: duration,
                  curve: Curves.easeOut,
                  opacity: showPurple ? 1 : 0,
                  child: SvgPicture.asset(
                    'assets/svg/wave_fill_two.svg',

                    fit: BoxFit.contain,
                    height: 8.h,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

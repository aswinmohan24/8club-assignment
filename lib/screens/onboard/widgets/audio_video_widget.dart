import 'dart:developer';

import 'package:eight_club_test/providers/onboard_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui';

import 'package:eight_club_test/utils/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AudioVideoWidget extends ConsumerWidget {
  final VoidCallback micTap;
  final VoidCallback videoTap;

  const AudioVideoWidget({
    super.key,

    required this.micTap,
    required this.videoTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMicTapped = ref.watch(audioTapProvider);
    final isVideoTapped = ref.watch(videoTapProvider);
    log(isMicTapped.toString());
    return Container(
      width: 122.w,
      height: 63.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.borderLevel1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: micTap,
            child: MediaButonWidget(
              isLeftButton: true,
              buttonUrl: "assets/svg/mic.svg",
              isMicTapped: isMicTapped,
              isVideoTapped: false,
            ),
          ),
          Container(width: 1, height: 28, color: AppColors.borderLevel1),
          GestureDetector(
            onTap: videoTap,
            child: MediaButonWidget(
              isLeftButton: false,
              buttonUrl: "assets/svg/video.svg",
              isVideoTapped: isVideoTapped,
              isMicTapped: false,
            ),
          ),
        ],
      ),
    );
  }
}

class MediaButonWidget extends StatelessWidget {
  final bool isLeftButton;
  final String buttonUrl;
  final bool isMicTapped;
  final bool isVideoTapped;
  const MediaButonWidget({
    super.key,
    required this.isMicTapped,
    required this.isVideoTapped,
    required this.isLeftButton,
    required this.buttonUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 58.w,
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: isLeftButton
                ? BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    bottomLeft: Radius.circular(8.r),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.r),
                  ),
            gradient: isMicTapped || isVideoTapped
                ? AppColors.micbackgroundGradient
                : null,
          ),
        ),
        ClipRRect(
          clipBehavior: Clip.antiAlias,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(color: Colors.transparent),
          ),
        ),
        Center(
          child: SvgPicture.asset(buttonUrl, height: 23.h, width: 23.w),
        ),
      ],
    );
  }
}

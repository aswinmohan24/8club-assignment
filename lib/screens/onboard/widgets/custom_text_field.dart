import 'dart:developer';

import 'package:eight_club_test/core/extensions.dart';
import 'package:eight_club_test/providers/experience_provider.dart';
import 'package:eight_club_test/providers/onboard_provider.dart';
import 'package:eight_club_test/utils/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app.typography.dart';

class CustomTextField extends ConsumerWidget {
  final double viewInsects;
  final bool isOnboardScreen;
  final bool isFileAttached;
  final String hintText;
  // final bool isRecording;
  const CustomTextField({
    super.key,
    required this.viewInsects,
    required this.hintText,
    this.isOnboardScreen = false,
    this.isFileAttached = false,
    // this.isRecording = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRecording = ref.watch(audioTapProvider);
    final isShowAudioWidget = ref.watch(audioWidgetVisibilityProvider);
    // final isVideoTapped = ref.watch(videoTapProvider);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: context.width(),

      height: getTextFieldHeight(
        viewInsets: viewInsects,
        isOnboardScreen: isOnboardScreen,
        isFileAttached: isFileAttached,
        isRecording: isRecording,
        showAudioWidget: isShowAudioWidget,
      ),
      decoration: BoxDecoration(
        border: viewInsects > 0
            ? Border.all(width: 1, color: AppColors.purple)
            : Border(),
        color: AppColors.white2,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Consumer(
        builder: (context, ref, child) {
          return TextField(
            onChanged: (value) {
              ref.watch(experienceSelectionProvider.notifier).updateText(value);
            },
            style: AppText.body1Regular,
            inputFormatters: [LengthLimitingTextInputFormatter(250)],

            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppText.h3regularr,
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          );
        },
      ),
    );
  }
}

double getTextFieldHeight({
  required viewInsets,
  required bool isOnboardScreen,
  required bool isFileAttached,
  required bool isRecording,
  required bool showAudioWidget,
}) {
  log('show ${showAudioWidget.toString()}');
  if (isOnboardScreen == true) {
    if (showAudioWidget) {
      return 172.h;
    }
    if (viewInsets > 0) {
      if (isFileAttached) {
        return 98.h;
      } else if (showAudioWidget) {
        return 172.h;
      }
      // else if (showAudioWidget) {
      //   return 172.h;
      // }
      else {
        return 130.h;
      }
    } else {
      return 320.h;
    }
  } else {
    if (viewInsets > 0) {
      return 104.h;
    } else {
      return 160.h;
    }
  }
}

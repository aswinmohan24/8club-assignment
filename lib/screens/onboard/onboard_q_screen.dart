import 'dart:developer';
import 'dart:io';

import 'package:eight_club_test/core/common/widgets/border_painter.dart';
import 'package:eight_club_test/core/common/widgets/submit_button.dart';
import 'package:eight_club_test/core/constants.dart';
import 'package:eight_club_test/core/extensions.dart';
import 'package:eight_club_test/providers/onboard_provider.dart';
import 'package:eight_club_test/screens/onboard/widgets/audio_video_widget.dart';
import 'package:eight_club_test/screens/onboard/widgets/custom_text_field.dart';
import 'package:eight_club_test/screens/onboard/widgets/progress_bar_widget.dart';
import 'package:eight_club_test/utils/app.colors.dart';
import 'package:eight_club_test/utils/app.spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app.typography.dart';
import 'package:waveform_recorder/waveform_recorder.dart';

import 'widgets/audio.recording_widget.dart' show AudioRecordingWidget;

class OnboardQuestionScreen extends ConsumerStatefulWidget {
  const OnboardQuestionScreen({super.key});

  @override
  ConsumerState<OnboardQuestionScreen> createState() =>
      _OnboardQuestionScreenState();
}

class _OnboardQuestionScreenState extends ConsumerState<OnboardQuestionScreen> {
  final WaveformRecorderController _controller = WaveformRecorderController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void start() async {
    await _controller.startRecording();
    ref.read(audioTapProvider.notifier).state = true;
  }

  void stop() async {
    await _controller.stopRecording();

    // ref.read(audioTapProvider.notifier).state = false;

    //  Recorded audio file path
    if (_controller.file != null) {
      log("Audio file saved at: ${_controller.file?.path}");
      ref.read(audioFileProvider.notifier).state = File(_controller.file!.path);
    } else {
      log("Not file recored");
    }
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardVisible = context.viewInsects() > 0;
    final isRecording = ref.watch(audioTapProvider);
    final audioFile = ref.watch(audioFileProvider.notifier).state;
    final isShowAudioWidget = ref.watch(audioWidgetVisibilityProvider);
    log("is file ${audioFile?.path}");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.width(), 100.h),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.hx20,
                vertical: AppSpacing.hx8,
              ),
              child: Container(
                width: 358.w,
                height: 104.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.white2,
                  border: Border.all(color: AppColors.borderLevel2, width: 1),
                ),
              ),
            ),
            ProgressBarWidget(fillValue: 2),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: AppSpacing.w20, right: AppSpacing.w20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),

            Text("02", style: AppText.s1Regukar),
            SizedBox(height: AppSpacing.hx4),
            Text(
              onboardingQuesion,
              style: context.viewInsects() > 0
                  ? AppText.body2Regukar
                  : AppText.h2Bold,
            ),
            SizedBox(height: AppSpacing.hx8),
            isKeyboardVisible == false
                ? Text(onboardingSubQ, style: AppText.body2RegularLow)
                : const SizedBox(),

            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.hx16),
              child: CustomTextField(
                viewInsects: context.viewInsects(),
                isOnboardScreen: true,
                hintText: "/ Start typing here",
              ),
            ),

            // condition for showing recorder widget
            isRecording || isShowAudioWidget
                ? AudioRecordingWidget(controller: _controller)
                : const SizedBox(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 56.h),
                child: Consumer(
                  builder: (context, ref, child) {
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AudioVideoWidget(
                          micTap: () {
                            ref.read(audioTapProvider.notifier).state = !ref
                                .read(audioTapProvider.notifier)
                                .state;
                            ref
                                    .read(
                                      audioWidgetVisibilityProvider.notifier,
                                    )
                                    .state =
                                true;
                            if (_controller.isRecording) {
                              ref.read(recordingTextProvider.notifier).state =
                                  "Audio Recorded";
                              stop();
                            } else {
                              start();
                            }
                          },
                          videoTap: () {
                            ref.watch(videoTapProvider.notifier).state = !ref
                                .watch(videoTapProvider.notifier)
                                .state;
                            stop();
                          },
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 58,
                              minHeight: 58,
                            ),
                            child: CustomPaint(
                              foregroundPainter: GradientBorderPainter(
                                strokeWidth: .6,
                                radius: 8,
                              ),
                              child: SubmitButton(),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

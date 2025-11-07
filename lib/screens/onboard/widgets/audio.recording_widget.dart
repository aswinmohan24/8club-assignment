import 'dart:developer';

import 'package:eight_club_test/utils/app.colors.dart';
import 'package:eight_club_test/utils/app.spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:waveform_recorder/waveform_recorder.dart';

import '../../../providers/onboard_provider.dart';
import '../../../utils/app.typography.dart';

class AudioRecordingWidget extends StatefulWidget {
  final WaveformRecorderController controller;

  const AudioRecordingWidget({super.key, required this.controller});

  @override
  State<AudioRecordingWidget> createState() => _AudioRecordingWidgetState();
}

final player = AudioPlayer();

class _AudioRecordingWidgetState extends State<AudioRecordingWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final text = ref.watch(recordingTextProvider);
        final isRecording = ref.watch(audioTapProvider);
        return Column(
          children: [
            ///  Your Container with waveform inside
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.w16,
                  vertical: AppSpacing.hx8,
                ),
                width: double.infinity,
                height: isRecording ? 140 : 80,
                decoration: BoxDecoration(
                  color: AppColors.white2,
                  borderRadius: BorderRadius.circular(12.r),
                ),

                /// The new WaveformRecorder widget lives INSIDE container
                child: Column(
                  // spacing: 16.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isRecording
                            ? Text(text, style: AppText.h3regularWhite)
                            : SizedBox(),
                        GestureDetector(
                          onTap: () {
                            widget.controller.cancelRecording();
                            widget.controller.stopRecording();
                            ref
                                    .read(
                                      audioWidgetVisibilityProvider.notifier,
                                    )
                                    .state =
                                false;
                          },
                          child: SvgPicture.asset("assets/svg/trash-2.svg"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: isRecording
                              ? AppColors.purple
                              : AppColors.purpleDark,
                          radius: 20.r,
                          child: GestureDetector(
                            onTap: () async {
                              log(widget.controller.isRecording.toString());
                              if (!widget.controller.isRecording) {
                                if (player.playing) {
                                  player.pause();
                                } else {
                                  final file = ref.read(audioFileProvider);
                                  if (file != null) {
                                    await player.setFilePath(file.path);
                                    player.play();
                                  }
                                }
                              } else {
                                widget.controller.stopRecording();
                                ref.read(audioTapProvider.notifier).state =
                                    false;
                              }
                            },
                            child: Center(
                              child: SvgPicture.asset(
                                isRecording
                                    ? "assets/svg/mic.svg"
                                    : "assets/svg/play.svg",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        isRecording
                            ? Expanded(
                                child: WaveformRecorder(
                                  controller: widget.controller,

                                  height: 90,
                                  waveColor: Colors.white, // You can style
                                  durationTextStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.purple,
                                  ),
                                  onRecordingStarted: () {
                                    debugPrint("Recording started");
                                  },
                                  onRecordingStopped: () {
                                    // debugPrint("Recording stopped");
                                  },
                                ),
                              )
                            : Text(text, style: AppText.h3regularWhite),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

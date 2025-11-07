import 'dart:developer';

import 'package:eight_club_test/core/common/widgets/border_painter.dart';
import 'package:eight_club_test/core/constants.dart';
import 'package:eight_club_test/core/common/widgets/submit_button.dart';
import 'package:eight_club_test/providers/experience_provider.dart';
import 'package:eight_club_test/screens/onboard/onboard_q_screen.dart';
import 'package:eight_club_test/screens/onboard/widgets/custom_text_field.dart';
import 'package:eight_club_test/screens/onboard/widgets/experience_image_widget.dart';
import 'package:eight_club_test/core/extensions.dart';
import 'package:eight_club_test/screens/onboard/widgets/progress_bar_widget.dart'
    show ProgressBarWidget;
import 'package:eight_club_test/utils/app.spacing.dart';
import 'package:eight_club_test/utils/app.typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.width(), 100.h),
        child: ProgressBarWidget(fillValue: 1),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: AppSpacing.w20,
            right: AppSpacing.w20,
            bottom: 15.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text('01', style: AppText.s1Regukar),
              SizedBox(height: AppSpacing.hx4),
              Text(
                experienceTitle,
                style: context.viewInsects() > 0
                    ? AppText.body2Regukar
                    : AppText.h2Bold,
              ),
              SizedBox(height: AppSpacing.hx12),
              SizedBox(height: 100.w, child: ExperienceImageWidget()),
              SizedBox(height: AppSpacing.hx12),
              CustomTextField(
                viewInsects: context.viewInsects(),
                hintText: experienceHint,
              ),
              SizedBox(height: AppSpacing.hx16),
              Consumer(
                builder: (context, ref, child) {
                  final selection = ref.watch(experienceSelectionProvider);
                  final isValid =
                      selection.ids.isNotEmpty &&
                      selection.text.trim().isNotEmpty;

                  return Opacity(
                    opacity: isValid ? 1 : 0.3,
                    child: GestureDetector(
                      onTap: () {
                        final state = ref.read(experienceSelectionProvider);
                        log(
                          "Selected images id's are ${state.ids} and text is ${state.text}",
                        );
                        isValid
                            ? Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) {
                                    return OnboardQuestionScreen();
                                  },
                                ),
                              )
                            : null;
                      },
                      child: SizedBox(
                        height: 56.h,
                        child: CustomPaint(
                          foregroundPainter: GradientBorderPainter(
                            strokeWidth: .6,
                            radius: 8,
                          ),
                          child: SubmitButton(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

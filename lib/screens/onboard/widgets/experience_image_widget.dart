import 'package:eight_club_test/models/experience.model.dart';
import 'package:eight_club_test/providers/experience_provider.dart';
import 'package:eight_club_test/utils/app.spacing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';

class ExperienceImageWidget extends ConsumerStatefulWidget {
  const ExperienceImageWidget({super.key});

  @override
  ConsumerState<ExperienceImageWidget> createState() =>
      _ExperienceImageWidgetState();
}

class _ExperienceImageWidgetState extends ConsumerState<ExperienceImageWidget> {
  final ScrollController _scrollController = ScrollController();

  void scrollToFirst() {
    Future.delayed(Duration(milliseconds: 50), () {
      _scrollController.animateTo(
        0,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(experienceListProvider);
    final state = ref.watch(experienceSelectionProvider);

    return asyncValue.when(
      data: (data) {
        final experienceList = data.experiences;

        return ImplicitlyAnimatedList<Experience>(
          controller: _scrollController,
          items: experienceList,
          scrollDirection: Axis.horizontal,
          // itemCount: experienceList.length,
          areItemsTheSame: (a, b) => a == b,
          shrinkWrap: true,
          itemBuilder: (context, animation, item, index) {
            final isSelected = state.ids.contains(experienceList[index].id);
            final rotations = [-3 * (3.14 / 180), 3 * (3.14 / 180), 0];

            final rotationAngle = rotations[index % 3];
            final scale = Tween<double>(begin: 1, end: 1.12).animate(animation);

            return Padding(
              padding: index == 0
                  ? EdgeInsets.only(
                      right: AppSpacing.w12,
                      top: AppSpacing.hx8,
                      bottom: AppSpacing.hx8,
                    )
                  : EdgeInsets.symmetric(
                      horizontal: AppSpacing.w12,
                      vertical: AppSpacing.hx8,
                    ),
              child: Transform.rotate(
                angle: rotationAngle.toDouble(),
                child: ScaleTransition(
                  scale: scale,
                  child: GestureDetector(
                    onTap: () async {
                      ref
                          .read(experienceSelectionProvider.notifier)
                          .toggleId(experienceList[index].id);
                      setState(() {
                        final selected = experienceList.removeAt(index);
                        experienceList.insert(0, selected);
                      });
                      scrollToFirst();
                    },
                    child: Opacity(
                      opacity: isSelected ? 1 : .5,
                      child: ColorFiltered(
                        colorFilter: isSelected
                            ? const ColorFilter.mode(
                                Colors.transparent,
                                BlendMode.multiply,
                              )
                            : const ColorFilter.matrix([
                                0.2126,
                                0.7152,
                                0.0722,
                                0,
                                0,
                                0.2126,
                                0.7152,
                                0.0722,
                                0,
                                0,
                                0.2126,
                                0.7152,
                                0.0722,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1,
                                0,
                              ]),
                        child: Container(
                          width: 96.w,
                          height: 96.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                experienceList[index].imageUrl,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      loading: () {
        return Center(child: SizedBox());
      },
      error: (error, stackTrace) => Text("Unable to load data"),
    );
  }
}

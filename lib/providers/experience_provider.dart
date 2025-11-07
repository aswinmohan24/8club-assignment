import 'package:eight_club_test/models/experience.model.dart';
import 'package:eight_club_test/models/experinece_selection_model.dart';
import 'package:eight_club_test/services/experience_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// experience service provider
final experienceListProvider = FutureProvider.autoDispose<ExperienceModel>((
  ref,
) async {
  return await ExperienceService.getAllExperience();
});

//  experience selection state notifier and provider
final experienceSelectionProvider =
    NotifierProvider<ExperienceSelectionNotifier, ExperienceSelectionState>(
      ExperienceSelectionNotifier.new,
    );

class ExperienceSelectionNotifier extends Notifier<ExperienceSelectionState> {
  @override
  ExperienceSelectionState build() {
    return ExperienceSelectionState(ids: [], text: "");
  }

  void toggleId(int id) {
    if (state.ids.contains(id)) {
      state = state.copyWith(ids: state.ids.where((e) => e != id).toList());
    } else {
      state = state.copyWith(ids: [...state.ids, id]);
    }
  }

  void updateText(String value) {
    state = state.copyWith(text: value);
  }
}

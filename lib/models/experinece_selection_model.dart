class ExperienceSelectionState {
  final List<int> ids;
  final String text;

  ExperienceSelectionState({required this.ids, required this.text});

  ExperienceSelectionState copyWith({List<int>? ids, String? text}) {
    return ExperienceSelectionState(
      ids: ids ?? this.ids,
      text: text ?? this.text,
    );
  }
}

import 'dart:io';

import 'package:flutter_riverpod/legacy.dart';

final audioTapProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

final videoTapProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

final recordingTextProvider = StateProvider.autoDispose<String>((ref) {
  return "Recording Audio...";
});

final audioFileProvider = StateProvider<File?>((ref) {
  return null;
});

final audioWidgetVisibilityProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

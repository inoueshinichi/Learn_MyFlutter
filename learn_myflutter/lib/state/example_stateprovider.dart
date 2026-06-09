import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ThemeMode { system, light, dark }

///////////////////
// StateProvider //
///////////////////
final viewModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.system;
});

// UI側
// final mode = ref.watch(viewModeProvider);
// ref.read(viewModeProvider.notifier).state = ThemeMode.light;
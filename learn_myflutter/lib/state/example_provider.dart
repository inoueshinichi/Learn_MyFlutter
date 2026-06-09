import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//////////////
// Provider //
//////////////
final greetProvider = Provider((ref) {
  return "Hello, Riverpod Provider!";
});


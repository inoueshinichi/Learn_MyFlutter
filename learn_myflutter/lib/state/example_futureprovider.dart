import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


////////////////////
// FutureProvider //
////////////////////
final helloProvider = FutureProvider<String>((ref) async {
  await Future.delayed(const Duration(seconds: 1));
  return "Hello World!";
});
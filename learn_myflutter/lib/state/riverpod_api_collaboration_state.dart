import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod_api_collaboration_state.g.dart';


@riverpod
Raw<Future<Map<String, dynamic>>> firstWebApi(FirstWebApiRef ref) async {
  await Future.delayed(const Duration(seconds: 3));
  String jsonString = '{"name": "TinyTank", "id": 1}';
  Map<String, dynamic> userMap = jsonDecode(jsonString);
  return userMap;
}


@riverpod
Raw<Future<Map<String, dynamic>>> secondWebApi(SecondWebApiRef ref) async {
  await Future.delayed(const Duration(seconds: 4));
  String jsonString = '{"age": 35}';
  Map<String, dynamic> ageMap = jsonDecode(jsonString);
  return ageMap;
}

@riverpod
Future<Map<String, dynamic>> combineWebApi(CombineWebApiRef ref) async {
  final firstMap = await ref.watch(firstWebApiProvider);
  final secondMap = await ref.watch(secondWebApiProvider);
  final Map<String, dynamic> combMap = {
    ...firstMap,
    ...secondMap,
  };
  return combMap;
}



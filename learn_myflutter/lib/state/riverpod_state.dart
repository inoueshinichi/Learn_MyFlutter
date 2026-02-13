import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'riverpod_state.g.dart';

@riverpod
String greet(GreetRef ref) {
  return "Hello World!";
}


@riverpod
class CounterNotifier extends _$CounterNotifier {
  @override
  int build() => 0;

  void increment() {
    state = state + 1;
  }

  void decrement() {
    state = state - 1;
  }

  void reset() {
    state = 0;
  }
}




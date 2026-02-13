import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod_async_state.g.dart';

/*非同期*/


@riverpod
Future<String> asyncGreet(AsyncGreetRef ref) async {
  await Future.delayed(const Duration(seconds: 1));
  return "This is Async Riverpod.";
}

@riverpod
class AsyncCounterNotifier extends _$AsyncCounterNotifier {
  @override
  Future<int> build() async {
    await Future.delayed(const Duration(seconds: 1));
    return 0;
  }

  Future<void> increment() async {
    final currentValue = state.valueOrNull;
    if (currentValue == null) {
      return;
    }
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 1));
    state = AsyncValue.data(currentValue + 1);
  }

  Future<void> decrement() async {
    final currentValue = state.valueOrNull;
    if (currentValue == null) {
      return;
    }
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 1));
    state = AsyncValue.data(currentValue - 1);
  }

  Future<void> reset() async {
    final currentValue = state.valueOrNull;
    if (currentValue == null) {
      return;
    }
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 1));
    state = AsyncValue.data(0);
  }
}


@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  Future<String> build() async {
    // 1. 初回のデータ取得(API通信のシミュレーション)
    return await _fetchNameFromServer();
  }

  // データを更新するメソッド
  Future<void> updateName(String newName) async {
    // 状態を「ローディング」にする(任意)
    state = const AsyncValue.loading();

    // state = AsyncValue.guard(() async { ... }) を使うと
    // try-catchを省略してエラーハンドリングができる.
    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 1)); // 通信中...
      return newName;
    });
  }

  // 疑似API
  Future<String> _fetchNameFromServer() async {
    await Future.delayed(const Duration(seconds: 2));
    return '初期ユーザー';
  }
}
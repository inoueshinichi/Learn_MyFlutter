import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/////////////////////////////
// AsyncNotifier(Provider) //
/////////////////////////////

// AsyncNotifier
class UserAsyncNotifier extends AsyncNotifier<String> {
  @override
  Future<String> build() async {
    // 初期データの取得ロジック
    return _fetchInitialUser();
  }

  Future<String> _fetchInitialUser() async {
    await Future.delayed(const Duration(seconds: 2));
    return "TinyTank";
  }

  Future<void> updateName(String newName) async {
    // ローディング状態にしたい場合は、state = const AsyncLoading();
    state = const AsyncLoading();

    // 非同期処理のシミュレーション
    await Future.delayed(const Duration(seconds: 1));

    // 新しい状態
    state = AsyncData(newName);
  }
}

// AsyncNotifierProvider
final userNotifierProvider = AsyncNotifierProvider<UserAsyncNotifier, String>(() {
  return UserAsyncNotifier();
});
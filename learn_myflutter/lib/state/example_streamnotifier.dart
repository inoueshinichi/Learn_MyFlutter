import 'package:riverpod_annotation/riverpod_annotation.dart';

// 1秒ごとにカウントが進むストリームを管理する例
class MyCounterNotifier extends StreamNotifier<int> {
  @override
  Stream<int> build() {
    // この戻り値の Stream が自動的に監視対象（state）になります
    return Stream.periodic(const Duration(seconds: 1), (i) => i);
  }

  // 必要に応じて、状態を操作するメソッドを追加できる
  void reset() {
    // 注意: StreamNotifier の state を直接書き換えるのは特殊なケースです。
    // 基本は build で返した Stream の流れに従います。
  }
}

// プロバイダーの定義
final myCounterProvider = StreamNotifierProvider<MyCounterNotifier, int>(
  MyCounterNotifier.new,
);


// UI側
// @override
// Widget build(BuildContext context, WidgetRef ref) {
//   final asyncCount = ref.watch(myCounterProvider);
//
//   return asyncCount.when(
//     data: (count) => Text('Count: $count'),
//     loading: () => const CircularProgressIndicator(),
//     error: (err, stack) => Text('Error: $err'),
//   );
// }


// クラス,向いているケース
// StreamProvider,Firebase Auth や Firestore のように、外部から流れてくるデータをただ表示したいだけの場合。
// StreamNotifier,ストリームを監視しつつ、独自のロジックやメソッド（副作用）をクラス内に持たせたい場合。
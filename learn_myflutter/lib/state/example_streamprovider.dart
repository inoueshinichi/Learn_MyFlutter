import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


////////////////////
// StreamProvider //
////////////////////
// 利用ポイント： 値が勝手に更新されるのを待ち構えるとき
// チャット, 通知, リアルタイム株価, センサーデータなど

// Provider : Stream<型>を返す関数
final tickerProvider = StreamProvider<int>((ref) {
  // 1秒毎にカウントアップするStream
  return Stream.periodic(const Duration(seconds: 1), (i) => i).take(10);
});

// Note 1
// ref.watchしているWidgetが破棄されると、Riverpodが自動的にストリームのcancel()が
// よびだされるので、メモリリークを回避できる。

// Note 2
// 手動定義の場合、画面を離れたら, Streamの購読を停止したい場合ときに.autoDisposeをつける
// final chatProvider = StreamProvider.autoDispose<List<Message>>((ref) {
//   return my_repository.getMessages();
// });


// UI側
// final AsyncValue<int> tickerAsync = ref.watch(tickerProvider);
// tickerAsync.when(
//   data: (value) => Text('カウント: $value'),
//   loading: () => const CircularProgressIndicator(),
//   error: (error, stackTrace) => Text('エラーが発生しました: $error'),
// );



// class StreamExampleWidget extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // watch すると AsyncValue<int> が返ってくる
//     final streamAsync = ref.watch(countStreamProvider);
//
//     return streamAsync.when(
//       // データが流れてきた時
//       data: (count) => Text('現在の値: $count', style: const TextStyle(fontSize: 24)),
//       // 最初のデータが届くまでの待機中
//       loading: () => const CircularProgressIndicator(),
//       // エラーが発生した時
//       error: (err, stack) => Text('エラーが発生しました: $err'),
//     );
//   }
// }
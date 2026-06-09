import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/**
 * Provider
 */
final appNameProvider = Provider<String>((ref) => 'TinyTank Mobile');

/**
 * StateProvider
 */
final counterProvider = StateProvider<int>((ref) => 0);

final singleCounterProvider = Provider<int>((ref) {
  final counter = ref.watch(counterProvider);
  return counter;
});

// Providerの内部からはwatchで外部のProviderを参照して、新規状態を作れる
final doubleCounterProvider = Provider<int>((ref) {
  final counter = ref.watch(singleCounterProvider);
  return counter * 2;
});


class RiverpodProviderPage extends ConsumerWidget {
  const RiverpodProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerを監視して値を取得するには`watch`
    final appName = ref.watch(appNameProvider);

    final singleCounter = ref.watch(singleCounterProvider);

    // counterProviderが更新されるとdoubleCounterProviderも更新される
    final doubleCounter = ref.watch(doubleCounterProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverpodProvider'),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(appName, style: TextStyle(fontSize: 20)),
                Text('カウント値: $singleCounter', style: TextStyle(fontSize: 20)),
                Text('2倍されたカウント値: $doubleCounter', style: TextStyle(fontSize: 20)),
                ElevatedButton(
                  onPressed: () => ref.read(counterProvider.notifier).update((state) => state + 1),
                  child: const Text('カウントアップ'),
                ),
                Spacer(),
              ],
            )
        ),
      )
    );
  }
}
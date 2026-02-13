import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'riverpod_state.dart';

class StateRiverpodV2Page extends ConsumerWidget {
  const StateRiverpodV2Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greet = ref.watch(greetProvider);
    final counter = ref.watch(counterNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Riverpod v2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(20)),
            Text(greet),
            Padding(padding: EdgeInsets.all(20)),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
                onPressed: () => ref.read(counterNotifierProvider.notifier).increment(),
                child: const Text('Inc'),
            ),
            ElevatedButton(
              onPressed: () => ref.read(counterNotifierProvider.notifier).decrement(),
              child: const Text('Dec'),
            ),
            ElevatedButton(
              onPressed: () => ref.read(counterNotifierProvider.notifier).reset(),
              child: const Text('Reset'),
            ),
          ],
        ),
      ),

    );
  }
}
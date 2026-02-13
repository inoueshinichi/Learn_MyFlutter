import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final greetProvider = Provider((ref) {
  return "Hello, Riverpod Provider!";
});

class CounterNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void increment() {
    state = state + 1;
  }
}

final counterNotifierProvider = NotifierProvider<CounterNotifier, int>(() {
  return CounterNotifier();
});


class StateRiverpodV1Page extends ConsumerWidget {
  const StateRiverpodV1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greet = ref.watch(greetProvider);
    final counter = ref.watch(counterNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Riverpod v1'),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterNotifierProvider.notifier).increment();
          },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
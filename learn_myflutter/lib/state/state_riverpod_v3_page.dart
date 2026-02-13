import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'riverpod_async_state.dart';
import 'riverpod_api_collaboration_state.dart';

class StateRiverpodV3Page extends ConsumerWidget {
  const StateRiverpodV3Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1
    final AsyncValue<String> greet = ref.watch(asyncGreetProvider);
    final AsyncValue<int> counter = ref.watch(asyncCounterNotifierProvider);

    // 2
    final user = ref.watch(userNotifierProvider); // async

    // 3
    final userMap = ref.watch(combineWebApiProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Riverpod v3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(20)),
            greet.when(
                data: (greet) => Text(greet),
                error: (e, st) => Text(e.toString()),
                loading: () => const Text('Loading'),
            ),
            Padding(padding: EdgeInsets.all(20)),
            const Text(
              'You have pushed the button this many times:',
            ),
            counter.when(
              data: (value) => Text("$value", style: Theme.of(context).textTheme.headlineMedium,),
              error: (e, st) => Text(e.toString(), style: Theme.of(context).textTheme.headlineMedium,),
              loading: () => const CircularProgressIndicator(),
            ),
            Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
              onPressed: () => ref.read(asyncCounterNotifierProvider.notifier).increment(),
              child: const Text('Async Inc'),
            ),
            ElevatedButton(
              onPressed: () => ref.read(asyncCounterNotifierProvider.notifier).decrement(),
              child: const Text('Async Dec'),
            ),
            ElevatedButton(
              onPressed: () => ref.read(asyncCounterNotifierProvider.notifier).reset(),
              child: const Text('Async Reset'),
            ),
            Padding(padding: EdgeInsets.all(20)),
            user.when(
              data: (name) => Text(name, style: TextStyle(fontSize: 30)),
              error: (e, st) => Text(e.toString(), style: TextStyle(fontSize: 30)),
              loading: () => const CircularProgressIndicator(),
            ),
            ElevatedButton(
              onPressed: () => ref.read(userNotifierProvider.notifier).updateName('Tiny Tank'),
              child: const Text('Update UserName'),
            ),
            Padding(padding: EdgeInsets.all(20)),
            userMap.when(
              data: (value) => Text('$value'),
              error: (e, st) => Text(e.toString()),
              loading: () => Text('現在、ローディング中: ${userMap.value}')
            ),
          ],
        ),
      ),
    );
  }
}
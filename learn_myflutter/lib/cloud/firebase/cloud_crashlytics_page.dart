import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CloudFirebaseCrashlyticsPage extends ConsumerWidget {
  const CloudFirebaseCrashlyticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('CloudFirebaseCrashlytics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 例外を発生させるボタン
            ElevatedButton(
                onPressed: () {
                  FirebaseCrashlytics.instance.log('ExceptionLog');
                  throw Exception("MyFlutterException");
                },
                child: const Text('Throw Error of Flutter'),
            ),
            // アプリをクラッシュさせるボタン
            ElevatedButton(
              onPressed: () {
                FirebaseCrashlytics.instance.log('CrashLog');
                FirebaseCrashlytics.instance.crash(); // 故意にクラッシュ
              },
              child: const Text('Crash'),
            ),
          ],
        )
      ),
    );
  }
}
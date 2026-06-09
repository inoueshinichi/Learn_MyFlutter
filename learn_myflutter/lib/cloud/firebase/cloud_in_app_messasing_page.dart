import 'package:flutter/material.dart';

import 'package:learn_myflutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart'; // In App Messaging
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/////////////////////////////
// AsyncNotifier(Provider) //
/////////////////////////////
class FirebaseInAppMessagingAsyncNotifier extends AsyncNotifier<List<String>> {
  late final FirebaseInAppMessaging fiam;
  String installedId = "";
  String appId = "";

  String getInstalledId() {
    return installedId;
  }

  String getAppId() {
    return appId;
  }

  @override
  Future<List<String>> build() async {
    try {
      fiam = FirebaseInAppMessaging.instance;
      String? token = await FirebaseMessaging.instance.getToken();

      appId = token!;

      // In App MessagingではインストールIDを使う
      installedId = token!.split(":")[0]; // tokenのXXXX:YYYYのXXXX部分がインストールID
      return [];
    } catch (e, st) {
      rethrow;
    }
  }

  Future<void> registerTrigger(String eventName) async {
    state = const AsyncLoading();
    final currentList = state.value ?? [];

    if (currentList.contains(eventName)) {
      return; // Nothing
    }

    state = await AsyncValue.guard(() async {
      // In App Messaging用のトリガーを登録
      await fiam.triggerEvent(eventName);

      final triggerList = state.valueOrNull ?? [];
      return [...triggerList, eventName];
    });
  }

  Future<void> unregisterTrigger(String eventName) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final triggerList = state.valueOrNull ?? [];
      if (!triggerList.contains(eventName)) {
        return triggerList; // Nothing
      }

      // In App Messaging
      List<String> removed = [
        ...triggerList.where((item) => item != eventName),
      ];
      return removed;
    });
  }

}

// AsyncNotifierProvider
final firebaseInAppMessagingAsyncNotifierProvider =
AsyncNotifierProvider<FirebaseInAppMessagingAsyncNotifier, List<String>>(() {
  return FirebaseInAppMessagingAsyncNotifier();
});



class CloudFirebaseInAppMessagingPage extends ConsumerWidget {
  const CloudFirebaseInAppMessagingPage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    // throw UnimplementedError();

    final inAppTriggerList = ref.watch(
        firebaseInAppMessagingAsyncNotifierProvider);

    final installedId = ref.read(firebaseInAppMessagingAsyncNotifierProvider.notifier).getInstalledId();
    final appId = ref.read(firebaseInAppMessagingAsyncNotifierProvider.notifier).getAppId();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CloudFirebaseInAppMessaging'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('$installedId', style: TextStyle(fontSize: 20)),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Text('$appId', style: TextStyle(fontSize: 20)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: inAppTriggerList.when(
                  data: (eventNameList) {
                    debugPrint('eventNameList: ${eventNameList}');
                    return eventNameList
                        .map((item) => Text('event: $item'))
                        .toList();
                  },
                  loading: () => const [CircularProgressIndicator()],
                  error: (err, stack) => [Text('エラーが発生しました: $err')],
                ),
              )
            ],
          )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () => {
              ref.read(
                  firebaseInAppMessagingAsyncNotifierProvider.notifier
              ).registerTrigger('message-event')
            },
            child: const SizedBox(
              child: const Text(
                'Add Event',
                textAlign: TextAlign.center, // 中央寄せ
              ),
            ),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () => {
              ref.read(
                  firebaseInAppMessagingAsyncNotifierProvider.notifier
              ).unregisterTrigger('message-event')
            },
            child: const SizedBox(
              child: const Text(
                'Remove Event',
                textAlign: TextAlign.center, // 中央寄せ
              ),
            ),
          ),
        ],
      ),
    );
  }
}
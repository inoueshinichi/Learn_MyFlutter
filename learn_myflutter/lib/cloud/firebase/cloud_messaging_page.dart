import 'package:flutter/material.dart';

import 'package:learn_myflutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; // Messaging
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:learn_myflutter/global_service.dart';

////////////////////
// FutureProvider //
////////////////////
final fcmTokenFutureProvider = FutureProvider<String?>((ref) {
  return FirebaseMessaging.instance.getToken();
});


////////////////////
// StreamProvider //
////////////////////
final fcmMessagingStreamProvider = StreamProvider<RemoteMessage?>((ref) {
  // 1. ストリームを取得
  final stream = FirebaseMessaging.onMessage;

  // 2. 念のためリスナーを登録（ここでは直接Streamを返せばRiverpodが管理してくれます）
  return stream; // ref.watchしているWidgetが破棄されたときに、このStreamも自動でcancel()メソッドされる.
});


class CloudFirebaseMessagingPage extends ConsumerWidget {
  const CloudFirebaseMessagingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    // throw UnimplementedError();

    final fcmToken = ref.watch(fcmTokenFutureProvider);

    // フォアグラウンドで通知を受け取る
    ref.listen<AsyncValue<RemoteMessage?>>(fcmMessagingStreamProvider, (previous, next) {
      // AsyncValue(streamの中身)に値があるときだけ
      next.whenData((message) {
        RemoteNotification? notification = message!.notification;

        // 通知が届いた瞬間に実行したい処理（ダイアログ表示など）
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('新着通知: ${notification?.title}')),
        // );

        if (notification == null) return;

        final flnpPlugin = ref.read(notificationPluginNotifierProvider);
        flnpPlugin.show(
          id: notification.hashCode,
          title: "${notification.title}: フォアグラウンド",
          body: notification.body,
          notificationDetails: const NotificationDetails(
            android: AndroidNotificationDetails(
              'channel_id',
              'channel_name',
            ),
            iOS: DarwinNotificationDetails(),
          ),
        );
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('CloudFirebaseMessaging'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'トークン',
              style: TextStyle(fontSize: 20),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            fcmToken.when(
              data: (token) {
                debugPrint('token: $token');
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(token.toString()),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('エラーが発生しました: $err'),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}






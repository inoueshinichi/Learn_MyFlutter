import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

// アプリ全体で共有する唯一のインスタンス
class NotificationPluginNotifier extends Notifier<FlutterLocalNotificationsPlugin> {

  @override
  FlutterLocalNotificationsPlugin build() {
    // TODO: implement build
    // throw UnimplementedError();
    state = FlutterLocalNotificationsPlugin();
    return state;
  }
}

final notificationPluginNotifierProvider = NotifierProvider<NotificationPluginNotifier, FlutterLocalNotificationsPlugin>(() {
  return NotificationPluginNotifier();
});


// 初期化処理を含めたロジックをまとめる Notifier
final notificationServiceProvider = Provider((ref) {
  final plugin = ref.watch(notificationPluginNotifierProvider);
  return NotificationService(plugin);
});

// UIメソッド側
class NotificationService {
  final FlutterLocalNotificationsPlugin plugin;
  NotificationService(this.plugin);

  // 起動時に一回だけ呼ぶ初期化メソッド
  Future<void> init() async {

    // android
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    // ios
    const DarwinInitializationSettings initializationSettingIOS =
    DarwinInitializationSettings(
      // 設定をここに追加
    );

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingIOS,
    );

    await plugin.initialize(settings: initializationSettings);
  }

  // 通知を送る共通メソッドなどをここに定義
  Future<void> showNotification(String title, String body) async {
    // ... 通知の詳細設定 ...
  }

}
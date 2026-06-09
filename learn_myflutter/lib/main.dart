import 'dart:async';
import 'dart:io';
import 'dart:ui'; // PlatformDispatcher のため
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_myflutter/global_service.dart';
import 'package:learn_myflutter/riverpod/riverpod_entry_page.dart';

// Firebase
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// Other
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


// I18N
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learn_myflutter/generated/l10n.dart';

// Riverpod
import 'package:flutter_riverpod/flutter_riverpod.dart';

// functions
import 'package:learn_myflutter/cloud/cloud_entry_page.dart';
import 'package:learn_myflutter/animation/anim_entry_page.dart';
import 'package:learn_myflutter/device/device_entry_page.dart';
import 'package:learn_myflutter/graphics/graphics_entry_page.dart';
import 'package:learn_myflutter/ios/ios_entry_page.dart';
import 'package:learn_myflutter/media/media_entry_page.dart';
import 'package:learn_myflutter/navigation/nav_entry_page.dart';
import 'package:learn_myflutter/access/access_entry_page.dart';
import 'package:learn_myflutter/setting/setting_entry_page.dart';
import 'package:learn_myflutter/state/state_entry_page.dart';
import 'package:learn_myflutter/ui/ui_entry_page.dart';

// applications
import 'package:learn_myflutter/counter.dart';
import 'package:learn_myflutter/edit_image.dart';
import 'package:learn_myflutter/puzzle.dart';
import 'package:learn_myflutter/todo.dart';
import 'package:learn_myflutter/hiragana.dart';
import 'package:learn_myflutter/elementkey.dart';


//////////////
// Riverpod //
//////////////
// 1. ProviderContainer を作成
final container = ProviderContainer();


// バックグラウンドハンドラ(バックグラウンドスレッドで呼ばれる)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;

  if (notification == null) return;

  // RiverpodのNotifierProvider経由でFlutterLocalNotificationPluginインスタンスを生成
  final flnpPlugin = container.read(notificationPluginNotifierProvider);

  // ここでFlutterLocalNotificationPluginインスタンスを生成
  // final flnpPlugin = FlutterLocalNotificationsPlugin();

  // const AndroidInitializationSettings initializationSettingsAndroid =
  //   AndroidInitializationSettings('@mipmap/ic_launcher');
  //
  // const DarwinInitializationSettings initializationSettingIOS =
  //   DarwinInitializationSettings(
  //     // 設定をここに追加
  //   );
  //
  //
  // const InitializationSettings initializationSettings = InitializationSettings(
  //   android: initializationSettingsAndroid,
  //   iOS: initializationSettingIOS,
  // );
  //
  // await flnpPlugin.initialize(settings: initializationSettings);

  // 通知
  flnpPlugin.show(
    id: notification.hashCode,
    title: "${notification.title}: バックグラウンド",
    body: notification.body,
    notificationDetails: const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'channel_name',
      ),
      iOS: DarwinNotificationDetails(),
    ),
  );
}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var os = Platform.operatingSystem;
  debugPrint(os);
  if (Platform.isAndroid) {
    debugPrint("Android");
  } else if (Platform.isIOS) {
    debugPrint("iOS");
  } else {
    debugPrint("Other platform");
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);



  // Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Firebase App Check
  // await FirebaseAppCheck.instance.activate(
  //   // 開発中は debug を指定
  //   providerAndroid: AndroidDebugProvider(debugToken: "a708bb98-b324-453c-a258-4eaff6ae06ba"), // android
  //   providerApple: AppleDebugProvider(),     // ios
  // );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug, // 最新の書き方
    appleProvider: AppleProvider.debug,
  );

  // 通知許可
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  debugPrint('User granted permission: ${settings.authorizationStatus}');

  // Firebase Messaging Background (バックグラウンドで通知を受け取る)
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);


  // 2. container.read を使ってプロバイダーを呼び出す
  final notificationService = container.read(notificationServiceProvider);
  await notificationService.init();

  // デバッグ中もレポートを送信するように強制する（テスト時のみ）
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  // 1. Flutterフレームワーク内（Widget build等）のエラーをキャッチ
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  };

  // 2. 非同期エラーや、Flutter外（プラットフォーム側）のエラーをすべてキャッチ
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // runApp(const ProviderScope(child: MyFlutterApp()));
  runApp(
    // 手動で作成したProviderContainerをProviderScopeに注入
      UncontrolledProviderScope(
        container: container,
        child: MyFlutterApp(),
      )
  );
}


class MyFlutterApp extends StatelessWidget {
  const MyFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyFlutterApp',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      locale: Locale('ja'),

      localizationsDelegates: [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,


      home: SafeArea(
          child: const HomePage()
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter Home Page'),
      ),
      body: const ListMenuView(),
    );
  }
}

class ListMenuView extends StatelessWidget {
  const ListMenuView({super.key});

  /* 機能 */

  void navUIPage(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const UIEntryPage()),
    );
  }

  void navSettingPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingEntryPage(),
      ),
    );
  }

  void navNavigationPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const NavEntryPage()),
    );
  }
  
  void navDevicePage(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const DeviceEntryPage()),
    );
  }

  void navIOSPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const IOSEntryPage()),
    );
  }

  void navAccessPage(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const AccessEntryPage()),
    );
  }

  void navStatePage(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const StateEntryPage()),
    );
  }

  void navMediaPage(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const MediaEntryPage()),
    );
  }

  void navGraphicsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const GraphicsEntryPage()),
    );
  }

  void navAnimPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AnimEntryPage()),
    );
  }

  void navCloudEntryPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CloudEntryPage(),
      ),
    );
  }

  void navRiverpodPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RiverpodEntryPage(),
      ),
    );
  }


  /* アプリ */

  void navPuzzlePage(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const StartPuzzlePage()),
    );
  }

  void navCounterPage(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const CounterPage(title: 'カウンターアプリ')),
    );
  }

  void navTodoPage(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const TodoPage()),
    );
  }

  void navEditImagePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EditImgStartPage(),
      ),
    );
  }

  void navHiraganaPage(BuildContext context) {
    Navigator.of(context).push(
     MaterialPageRoute(builder: (context) => const HiraganaStartPage()
     ),
    );
  }

  void navElementKeyPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ElementKeyPage()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          ListTile(
              // tileColor: Colors.blue,
              leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('UI'),
            onTap: () => navUIPage(context),
          ),
          ListTile(
            // tileColor: Colors.blue,
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Setting'),
            onTap: () => navSettingPage(context),
          ),
          ListTile(
            // tileColor: Colors.blue,
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Navigation'),
            onTap: () => navNavigationPage(context),
          ),
          ListTile(
            // tileColor: Colors.blue,
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Device'),
            onTap: () => navDevicePage(context),
          ),
          ListTile(
            // tileColor: Colors.blue,
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('IOS'),
            onTap: () => navIOSPage(context),
          ),
          ListTile(
            // tileColor: Colors.blue,
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Access'),
            onTap: () => navAccessPage(context),
          ),
          ListTile(
            // tileColor: Colors.blue,
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Cloud'),
            onTap: () => navCloudEntryPage(context),
          ),
          ListTile(
            // tileColor: Colors.blue,
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('State'),
            onTap: () => navStatePage(context),
          ),
          ListTile(
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Media'),
            onTap: () => navMediaPage(context),
          ),
          ListTile(
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Graphics'),
            onTap: () => navGraphicsPage(context),
          ),
          ListTile(
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Animation'),
            onTap: () => navAnimPage(context),
          ),
          ListTile(
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('-------'),
            onTap: () => {}
          ),
          ListTile(
            // tileColor: Colors.blue,
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Puzzle'),
            onTap: () => navPuzzlePage(context),
          ),
          ListTile(
            // tileColor: Colors.blue,
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Counter'),
            onTap: () => navCounterPage(context),
          ),
          ListTile(
            // tileColor: Colors.blue,
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Todo'),
            onTap: () => navTodoPage(context),
          ),
          ListTile(
            // tileColor: Colors.blue,
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Edit Image'),
            onTap: () => navEditImagePage(context),
          ),
          ListTile(
            // tileColor: Colors.blue,
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Hiragana'),
            onTap: () => navHiraganaPage(context),
          ),
          ListTile(
            // tileColor: Colors.blue,
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Element Key'),
            onTap: () => navElementKeyPage(context),
          ),
          ListTile(
            // tileColor: Colors.blue,
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 44,
                minWidth: 34,
                maxHeight: 64,
                maxWidth: 54,
              ),
              child: const FlutterLogo(),
            ),
            trailing: const Icon(Icons.more_vert),
            title: const Text('Riverpod'),
            onTap: () => navRiverpodPage(context),
          ),
        ]
      )
    );
  }
}



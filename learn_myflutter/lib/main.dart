import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:learn_myflutter/elementkey.dart';
import 'package:learn_myflutter/generated/l10n.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:learn_myflutter/animation/anim_entry_page.dart';
import 'package:learn_myflutter/counter.dart';
import 'package:learn_myflutter/device/device_entry_page.dart';
import 'package:learn_myflutter/edit_image.dart';
import 'package:learn_myflutter/graphics/graphics_entry_page.dart';
import 'package:learn_myflutter/ios/ios_entry_page.dart';
import 'package:learn_myflutter/media/media_entry_page.dart';
import 'package:learn_myflutter/navigation/nav_entry_page.dart';
import 'package:learn_myflutter/access/access_entry_page.dart';
import 'package:learn_myflutter/puzzle.dart';
import 'package:learn_myflutter/setting/setting_entry_page.dart';
import 'package:learn_myflutter/state/state_entry_page.dart';
import 'package:learn_myflutter/todo.dart';
import 'package:learn_myflutter/ui/ui_entry_page.dart';
import 'package:learn_myflutter/hiragana.dart';


void main() {
  var os = Platform.operatingSystem;
  print(os);
  if (Platform.isAndroid) {
    print("Android");
  } else if (Platform.isIOS) {
    print("iOS");
  } else {
    print("Other platform");
  }


  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(const ProviderScope(child: MyFlutterApp()));
  });
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

  /*画面遷移*/
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
        ]
      )
    );
  }
}



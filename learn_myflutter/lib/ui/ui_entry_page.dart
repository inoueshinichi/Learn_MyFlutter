import 'package:flutter/material.dart';
import 'package:learn_myflutter/ui/ui_appbar_page.dart';
import 'package:learn_myflutter/ui/ui_datetimepicker_page.dart';
import 'package:learn_myflutter/ui/ui_dialog_page.dart';
import 'package:learn_myflutter/ui/ui_drawer_page.dart';
import 'package:learn_myflutter/ui/ui_grid_page.dart';
import 'package:learn_myflutter/ui/ui_input_page.dart';
import 'package:learn_myflutter/ui/ui_isolate_page.dart';
import 'package:learn_myflutter/ui/ui_lifecycle_page.dart';
import 'package:learn_myflutter/ui/ui_linearprogress_page.dart';
import 'package:learn_myflutter/ui/ui_list_page.dart';
import 'package:learn_myflutter/ui/ui_pageview_page.dart';
import 'package:learn_myflutter/ui/ui_scroll_page.dart';
import 'package:learn_myflutter/ui/ui_text_page.dart';
import 'package:learn_myflutter/ui/ui_textfield_page.dart';


class UIEntryPage extends StatelessWidget {
  const UIEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI'),
      ),
      body: UIGridMenuView(),
    );
  }
}

class UIGridMenuView extends StatelessWidget {
  const UIGridMenuView({super.key});

  void navTextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UITextPage()),
    );
  }

  void navLifeCyclePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UILifeCyclePage(title: "WidgetLifeCycle", message: "最初の値")),
    );
  }

  void navScrollPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UIScrollPage()),
    );
  }

  void navListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UIListPage()),
    );
  }

  void navGridPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UIGridPage()),
    );
  }

  void navTextFieldPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UITextFieldPage()),
    );
  }

  void navDrawerPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const UIDrawerPage()),
    );
  }

  void navDialogPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const UIDialogPage()),
    );
  }

  void navInputPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const UIInputPage()),
    );
  }

  void navAppBarPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const UIAppBarPage()),
    );
  }
  
  void navPageviewPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (consxt) => const UIPageviewPage()),
    );
  }

  void navDateTimePickerPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const UIDatetimePickerPage()),
    );
  }

  void navLinearProgressPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const UILinearProgressPage()),
    );
  }

  void navIsolatePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const UIIsolatePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 5,
        shrinkWrap: true,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: <Widget>[
          ElevatedButton(
            onPressed: () => navTextPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('A'),
          ),
          ElevatedButton(
            onPressed: () => navLifeCyclePage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('B'),
          ),
          ElevatedButton(
            onPressed: () => navScrollPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('C'),
          ),
          ElevatedButton(
            onPressed: () => navListPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('D'),
          ),
          ElevatedButton(
            onPressed: () => navGridPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('E'),
          ),
          ElevatedButton(
            onPressed: () => navTextFieldPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('F'),
          ),
          ElevatedButton(
            onPressed: () => navDrawerPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('G'),
          ),
          ElevatedButton(
            onPressed: () => navDialogPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('H'),
          ),
          ElevatedButton(
            onPressed: () => navInputPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('I'),
          ),
          ElevatedButton(
            onPressed: () => navAppBarPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('J'),
          ),
          ElevatedButton(
            onPressed: () => navPageviewPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('K'),
          ),
          ElevatedButton(
            onPressed: () => navDateTimePickerPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('L'),
          ),
          ElevatedButton(
            onPressed: () => navLinearProgressPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('M'),
          ),
          ElevatedButton(
            onPressed: () => navIsolatePage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('N'),
          ),ElevatedButton(
            onPressed: () => {},
            child: const Text('O'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('P'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('Q'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('R'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('S'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('T'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('U'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('V'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('W'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('X'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('Y'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('Z'),
          ),
        ]
    );
  }
}
import 'package:flutter/material.dart';
import 'package:learn_myflutter/ui/ui_dialog_page.dart';
import 'package:learn_myflutter/ui/ui_drawer_page.dart';
import 'package:learn_myflutter/ui/ui_grid_page.dart';
import 'package:learn_myflutter/ui/ui_input_page.dart';
import 'package:learn_myflutter/ui/ui_lifecycle_page.dart';
import 'package:learn_myflutter/ui/ui_list_page.dart';
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
            child: const Text('A'),
          ),
          ElevatedButton(
            onPressed: () => navLifeCyclePage(context),
            child: const Text('B'),
          ),
          ElevatedButton(
            onPressed: () => navScrollPage(context),
            child: const Text('C'),
          ),
          ElevatedButton(
            onPressed: () => navListPage(context),
            child: const Text('D'),
          ),
          ElevatedButton(
            onPressed: () => navGridPage(context),
            child: const Text('E'),
          ),
          ElevatedButton(
            onPressed: () => navTextFieldPage(context),
            child: const Text('F'),
          ),
          ElevatedButton(
            onPressed: () => navDrawerPage(context),
            child: const Text('G'),
          ),
          ElevatedButton(
            onPressed: () => navDialogPage(context),
            child: const Text('H'),
          ),
          ElevatedButton(
            onPressed: () => navInputPage(context),
            child: const Text('I'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('J'),
          ),
        ]
    );
  }
}
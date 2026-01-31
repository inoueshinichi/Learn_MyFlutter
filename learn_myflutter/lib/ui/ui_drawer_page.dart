import 'package:flutter/material.dart';


class UIDrawerPage extends StatefulWidget {
  const UIDrawerPage({super.key});

  @override
  State<UIDrawerPage> createState() => UIDrawerPageState();
}


class UIDrawerPageState extends State<UIDrawerPage> {
  static var items = <Widget>[];
  static var message = 'ok.';
  static var tapped = 0;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 5; i++) {
      var item = ListTile(
        leading: const Icon(Icons.android),
        title: Text('No, $i'),
        onTap: () {
          tapped = i;
          tapItem();
        }
      );
      items.add(item);
    }
  }

  void tapItem() {
    Navigator.pop(context);
    setState(() {
      message = 'tapped:[$tapped]';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer UI'),
      ),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 32.0),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: items,
        ),
      ),
    );
  }

}
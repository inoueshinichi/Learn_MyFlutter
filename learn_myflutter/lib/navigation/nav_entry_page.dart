import 'package:flutter/material.dart';
import 'package:learn_myflutter/navigation/nav_btmbar_page.dart';
import 'package:learn_myflutter/navigation/nav_tabbar_page.dart';
import 'package:learn_myflutter/navigation/routing_app_page.dart';


class NavEntryPage extends StatelessWidget {
  const NavEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
      ),
      body: NavGridMenuView(),
    );
  }
}

class NavGridMenuView extends StatelessWidget {
  const NavGridMenuView({super.key});

  void navRoutingAppPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => NavRoutingAppPage()),
    );
  }

  void navBtmBarPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => NavBottomBarPage()),
    );
  }

  void navTabbarPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => NavTabbarPage()),
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
            onPressed: () => navRoutingAppPage(context),
            child: const Text('A'),
          ),
          ElevatedButton(
            onPressed: () => navBtmBarPage(context),
            child: const Text('B'),
          ),
          ElevatedButton(
            onPressed: () => navTabbarPage(context),
            child: const Text('C'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('D'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('E'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('F'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('G'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('H'),
          ),
          ElevatedButton(
            onPressed: () => {},
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
import 'package:flutter/material.dart';


class NavTabbarPage extends StatefulWidget {
  const NavTabbarPage({super.key});

  @override
  State<NavTabbarPage> createState() => NavTabbarPageState();
}


class NavTabbarPageState extends State<NavTabbarPage> {
  final List<Tab> tabs = <Tab>[
    const Tab(text: 'HOME', icon: Icon(Icons.home)),
    const Tab(text: 'MESSAGE', icon: Icon(Icons.message)),
    const Tab(text: 'SETTINGS', icon: Icon(Icons.settings)),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tab Bar (View)'),
            bottom: TabBar(tabs: tabs),
          ),
          body: const TabBarView(
            children: <Widget>[
              NavTabPage(title: 'HOME', textColor: Colors.black),
              NavTabPage(title: 'MESSAGE', textColor: Colors.red),
              NavTabPage(title: 'SETTINGS', textColor: Colors.green),
            ],
          ),
        ),
    );
  }
}


class NavTabPage extends StatelessWidget {
  final String title;
  final Color textColor;

  const NavTabPage({
    super.key,
    required this.title,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 64.0, color: textColor)),
        ],
      ),
    );
  }
}
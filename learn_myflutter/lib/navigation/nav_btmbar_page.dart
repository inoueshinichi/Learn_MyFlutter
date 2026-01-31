import 'package:flutter/material.dart';

class NavBottomBarPage extends StatefulWidget {
  const NavBottomBarPage({super.key});

  @override
  State<NavBottomBarPage> createState() => NavBottomBarPageState();
}


class NavBottomBarPageState extends State<NavBottomBarPage> {
  int selectedIndex = 0;

  static const List<Widget> pageItems = <Widget>[
    Text('First', style: TextStyle(fontSize: 64.0)),
    Text('Second', style: TextStyle(fontSize: 64.0)),
    Text('Third', style: TextStyle(fontSize: 64.0)),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar'),
      ),
      body: Center(
        child: pageItems.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'First',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Second',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Third',
            ),
          ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.orangeAccent,
        onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
        },
      ),
    );
  }
}
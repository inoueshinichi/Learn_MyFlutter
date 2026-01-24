import 'package:flutter/material.dart';

class UIListPage extends StatelessWidget {
  const UIListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView(
        children: [
          Container(
              height: 300.0,
              width: double.infinity,
              color: Colors.green,
              child: const Text('Tiny', style: TextStyle(fontSize: 25.0))
          ),
          Container(
              height: 300.0,
              width: double.infinity,
              color: Colors.blue,
              child: const Text('Tank', style: TextStyle(fontSize: 25.0))
          ),
          Container(
              height: 300.0,
              width: double.infinity,
              color: Colors.red,
              child: const Text('Flutter', style: TextStyle(fontSize: 25.0))
          ),
        ],
      ),
    );
  }
}
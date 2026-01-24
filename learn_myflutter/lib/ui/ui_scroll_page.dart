import 'package:flutter/material.dart';

class UIScrollPage extends StatelessWidget {
  const UIScrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.0,
              width: double.infinity,
              color: Colors.lightGreen,
              child: const Text('Hello', style: TextStyle(fontSize: 25.0))
            ),
            Container(
                height: 300.0,
                width: double.infinity,
                color: Colors.lightBlue,
                child: const Text('world', style: TextStyle(fontSize: 25.0))
            ),
            Container(
                height: 300.0,
                width: double.infinity,
                color: Colors.red,
                child: const Text('Flutter', style: TextStyle(fontSize: 25.0))
            ),
          ],
        ),
      ),
    );
  }
}
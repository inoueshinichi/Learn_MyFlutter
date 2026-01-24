import 'package:flutter/material.dart';

class UIGridPage extends StatelessWidget {
  const UIGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
        appBar: AppBar(
          title: const Text('GridView'),
        ),
        // body: GridView.count(
        //   crossAxisCount: 2,
        //   children: [
        //     Container(
        //         height: 300.0,
        //         width: double.infinity,
        //         color: Colors.green,
        //         child: const Text('Tiny', style: TextStyle(fontSize: 25.0))
        //     ),
        //     Container(
        //         height: 300.0,
        //         width: double.infinity,
        //         color: Colors.blue,
        //         child: const Text('Tank', style: TextStyle(fontSize: 25.0))
        //     ),
        //     Container(
        //         height: 300.0,
        //         width: double.infinity,
        //         color: Colors.red,
        //         child: const Text('Flutter', style: TextStyle(fontSize: 25.0))
        //     ),
        //   ],
        // ),
      body: GridView.extent(
        maxCrossAxisExtent: 100,
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
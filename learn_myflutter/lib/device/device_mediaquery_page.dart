import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class DeviceMediaQueryPage extends StatelessWidget {
  const DeviceMediaQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaQuery Orientation App'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.deepPurpleAccent,
        child: const Text('MediaQueryのサンプル', style: TextStyle(fontSize: 40.0)),
      ),
    );
  }
}
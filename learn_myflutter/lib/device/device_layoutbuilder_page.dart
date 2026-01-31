import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class DeviceLayoutBuilderPage extends StatelessWidget {
  const DeviceLayoutBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder App'),
      ),
      body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600.0) {
              return const DeviceLandscapeWidget();
            } else {
              return const DevicePortraitWidget();
            }
          }
      ),
    );
  }
}


class DeviceLandscapeWidget extends StatelessWidget {
  const DeviceLandscapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Container(
      height: 150.0,
      width: 150.0,
      color: Colors.red,
    );
  }
}


class DevicePortraitWidget extends StatelessWidget {
  const DevicePortraitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          height: 150.0,
          width: 150.0,
          color: Colors.red,
        ),
        Container(
          height: 150.0,
          width: 150.0,
          color: Colors.yellow,
        ),
      ],
    );
  }
}
import 'dart:io';
import 'package:flutter/material.dart';


class DevicePlatformPage extends StatelessWidget {
  const DevicePlatformPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Platform.isIOS ? const Text('iOS App') : const Text('Android App'),
      ),
      body: Container(
        child: Platform.isIOS ? const DeviceIOSRedWidget() : const DeviceAndroidGreenWidget(),
      ),
    );
  }
}


class DeviceIOSRedWidget extends StatelessWidget {
  const DeviceIOSRedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Container(
      height: 200.0,
      width: 200.0,
      color: Colors.red,
    );
  }
}


class DeviceAndroidGreenWidget extends StatelessWidget {
  const DeviceAndroidGreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200.0,
        width: 200.0,
        color: Colors.green,
      )
    );
  }
}


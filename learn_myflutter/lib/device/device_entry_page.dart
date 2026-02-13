import 'package:flutter/material.dart';
import 'package:learn_myflutter/device/device_accelgyro_page.dart';
import 'package:learn_myflutter/device/device_camera_page.dart';
import 'package:learn_myflutter/device/device_geolocator_page.dart';
import 'package:learn_myflutter/device/device_layoutbuilder_page.dart';
import 'package:learn_myflutter/device/device_mediaquery_page.dart';
import 'package:learn_myflutter/device/device_platform_page.dart';
import 'package:learn_myflutter/device/device_video_page.dart';


class DeviceEntryPage extends StatelessWidget {
  const DeviceEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device'),
      ),
      body: DeviceGridMenuView(),
    );
  }
}

class DeviceGridMenuView extends StatelessWidget {
  const DeviceGridMenuView({super.key});

  void navDevicePlatformPage(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const DevicePlatformPage())
    );
  }
  
  void navDeviceMediaQueryPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const DeviceMediaQueryPage())
    );
  }

  void navDeviceLayoutBuilderPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const DeviceLayoutBuilderPage())
    );
  }

  void navDeviceCameraPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const DeviceCameraPage())
    );
  }

  void navDeviceVideoPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const DeviceVideoPage())
    );
  }

  void navDeviceGeolocatorPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const DeviceGeolocatorPage())
    );
  }

  void navDeviceAccelgyroPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const DeviceAccelgyroPage())
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
            onPressed: () => navDevicePlatformPage(context),
            child: const Text('A'),
          ),
          ElevatedButton(
            onPressed: () => navDeviceMediaQueryPage(context),
            child: const Text('B'),
          ),
          ElevatedButton(
            onPressed: () => navDeviceLayoutBuilderPage(context),
            child: const Text('C'),
          ),
          ElevatedButton(
            onPressed: () => navDeviceCameraPage(context),
            child: const Text('D'),
          ),
          ElevatedButton(
            onPressed: () => navDeviceVideoPage(context),
            child: const Text('E'),
          ),
          ElevatedButton(
            onPressed: () => navDeviceGeolocatorPage(context),
            child: const Text('F'),
          ),
          ElevatedButton(
            onPressed: () => navDeviceAccelgyroPage(context),
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
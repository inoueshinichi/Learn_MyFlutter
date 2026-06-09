import 'package:flutter/material.dart';
import 'package:learn_myflutter/access/device_conectivity_page.dart';
import 'package:learn_myflutter/device/device_accelgyro_page.dart';
import 'package:learn_myflutter/device/device_ble_serial_page.dart';
import 'package:learn_myflutter/device/device_camera_page.dart';
import 'package:learn_myflutter/device/device_geolocator_page.dart';
import 'package:learn_myflutter/device/device_layoutbuilder_page.dart';
import 'package:learn_myflutter/device/device_mediaquery_page.dart';
import 'package:learn_myflutter/device/device_platform_page.dart';
import 'package:learn_myflutter/device/device_qrcode_page.dart';
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

  void navDeviceConnectivityPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const DeviceConnectivityPage()),
    );
  }

  void navDeviceQrcodePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const DeviceQrcodePage()),
    );
  }

  void navDeviceBLESerialPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const DeviceBLESerialPage()),
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
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('A'),
          ),
          ElevatedButton(
            onPressed: () => navDeviceMediaQueryPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('B'),
          ),
          ElevatedButton(
            onPressed: () => navDeviceLayoutBuilderPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('C'),
          ),
          ElevatedButton(
            onPressed: () => navDeviceCameraPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('D'),
          ),
          ElevatedButton(
            onPressed: () => navDeviceVideoPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('E'),
          ),
          ElevatedButton(
            onPressed: () => navDeviceGeolocatorPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('F'),
          ),
          ElevatedButton(
            onPressed: () => navDeviceAccelgyroPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('G'),
          ),
          ElevatedButton(
            onPressed: () => navDeviceConnectivityPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('H'),
          ),
          ElevatedButton(
            onPressed: () => navDeviceQrcodePage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('I'),
          ),
          ElevatedButton(
            onPressed: () => navDeviceBLESerialPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('J'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('K'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('L'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('M'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('N'),
          ),ElevatedButton(
            onPressed: () => {},
            child: const Text('O'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('P'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('Q'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('R'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('S'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('T'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('U'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('V'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('W'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('X'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('Y'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('Z'),
          ),
        ]
    );
  }
}
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class DeviceConnectivityPage extends StatefulWidget {
  const DeviceConnectivityPage({super.key});

  @override
  State<DeviceConnectivityPage> createState() => DeviceConnectivityPageState();
}


class DeviceConnectivityPageState extends State<DeviceConnectivityPage> {
  String mobileStr = "Mobile Connect";
  String wifiStr = "Wifi Connect";
  String bluetoothStr = "Bluetooth Connect";
  String ethernetStr = "Ethernet Connect";
  String vpnStr = "VPN Connect";

  Future<void> checkMobileConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!mounted) return;
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      debugPrint("Connect mobile!");
      // モバイル回線
      setState(() {
        mobileStr = "Mobile is connected!";
      });
    }
  }

  Future<void> checkWifiConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!mounted) return;
    if (connectivityResult.contains(ConnectivityResult.wifi)) {
      debugPrint("Connect wifi!");
      // Wifi回線
      setState(() {
        wifiStr = "Wifi is connected!";
      });
    }
  }

  Future<void> checkBluetoothConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!mounted) return;
    if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
      debugPrint("Connect bluetooth");
      // Bluetooth回線
      setState(() {
        bluetoothStr = "Bluetooth is connected!";
      });
    }
  }

  Future<void> checkEthernetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!mounted) return;
    if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      debugPrint("Connect Ethernet!");
      // Ethernet回線
      setState(() {
        ethernetStr = "Ethernet is connected!";
      });
    }
  }

  Future<void> checkVPNConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!mounted) return;
    if (connectivityResult.contains(ConnectivityResult.vpn)) {
      debugPrint("Connect VPN!");
      // VPN回線
      setState(() {
        vpnStr = "VPN is connected!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connectivity"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: checkMobileConnection,
                child: Text(mobileStr),
            ),
            ElevatedButton(
                onPressed: checkWifiConnection,
                child: Text(wifiStr),
            ),
            ElevatedButton(
                onPressed: checkBluetoothConnection,
                child: Text(bluetoothStr),
            ),
            ElevatedButton(
                onPressed: checkEthernetConnection,
                child: Text(ethernetStr),
            ),
            ElevatedButton(
                onPressed: checkVPNConnection,
                child: Text(vpnStr),
            ),
          ],
        )
      ),
    );
  }
}
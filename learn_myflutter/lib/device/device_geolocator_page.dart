import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class DeviceGeolocatorPage extends StatefulWidget {
  const DeviceGeolocatorPage({super.key});

  @override
  State<DeviceGeolocatorPage> createState() => DeviceGeolocatorPageState();
}


class DeviceGeolocatorPageState extends State<DeviceGeolocatorPage> {
  StreamSubscription<Position>? gpsPosSub;
  Position? gpsPos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tracking();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    gpsPosSub?.cancel();
    super.dispose();
  }

  Future<void> tracking() async {
    // 権限チェック
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    // 権限を取得
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }

    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 0, // 常に通知 (m)
    );

    gpsPosSub = Geolocator.getPositionStream(
      locationSettings: locationSettings,
    ).listen((Position? pos) {
      if (pos != null) {
        setState(() {
          gpsPos = pos;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    final latitude = gpsPos?.latitude ?? 0.0;
    final longitude = gpsPos?.longitude ?? 0.0;
    final altitude = gpsPos?.altitude ?? 0.0;

    // 北緯(+), 南緯(-)
    final lat = "緯度: ${latitude}";
    // 東経(+), 西経(-)
    final lon = "経度: ${longitude}";
    // 高度
    final alt = "高度: ${altitude}";

    /*距離*/
    final diffDist = Geolocator.distanceBetween(
        latitude,
        longitude,
        /*東京の緯度*/35.6894807,
        /*東京の経度*/139.6916863) / 1000; // km

    final distInMeters = "東京との距離: ${diffDist.toStringAsFixed(2)}";

    /*方位*/
    final _bearing = Geolocator.bearingBetween(
        latitude,
        longitude,
        /*東京の緯度*/35.6894807,
        /*東京の経度*/139.6916863);

    final bearing = "東京との方位: ${_bearing.toStringAsFixed(2)}";


    return Scaffold(
      appBar: AppBar(
        title: const Text('GPS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(lat, style: Theme.of(context).textTheme.headlineMedium),
            Text(lon, style: Theme.of(context).textTheme.headlineMedium),
            Text(alt, style: Theme.of(context).textTheme.headlineMedium),
            Text(distInMeters, style: Theme.of(context).textTheme.headlineMedium),
            Text(bearing, style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}
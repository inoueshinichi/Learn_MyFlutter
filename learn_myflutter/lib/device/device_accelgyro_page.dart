import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';


class DeviceAccelgyroPage extends StatefulWidget {
  const DeviceAccelgyroPage({super.key});

  @override
  State<DeviceAccelgyroPage> createState() => DeviceAccelgyroPageState();
}


class DeviceAccelgyroPageState extends State<DeviceAccelgyroPage> {
  List<double>? userAccelerometerValues;
  List<double>? accelerometerValues;
  List<double>? gyroscopeValues;
  List<double>? magnetValues;

  StreamSubscription<UserAccelerometerEvent>? userAccelSub;
  Stream<UserAccelerometerEvent> userAccelerometerEvents = userAccelerometerEventStream(
    samplingPeriod: SensorInterval.normalInterval
  );

  StreamSubscription<AccelerometerEvent>? accelSub;
  Stream<AccelerometerEvent> accelerometerEvents = accelerometerEventStream(
    samplingPeriod: SensorInterval.normalInterval,
  );

  StreamSubscription<GyroscopeEvent>? gyroSub;
  Stream<GyroscopeEvent> gyroscopeEvents = gyroscopeEventStream(
    samplingPeriod: SensorInterval.normalInterval,
  );

  StreamSubscription<MagnetometerEvent>? magnetSub;
  Stream<MagnetometerEvent> magnetEvents = magnetometerEventStream(
    samplingPeriod: SensorInterval.normalInterval,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userAccelSub = userAccelerometerEvents.listen(
        (UserAccelerometerEvent event) {
          setState(() {
            userAccelerometerValues = <double>[event.x, event.y, event.z];
          });
        }
    );

    accelSub = accelerometerEvents.listen(
        (AccelerometerEvent event) {
          setState(() {
            accelerometerValues = <double>[event.x, event.y, event.z];
          });
        }
    );

    gyroSub = gyroscopeEvents.listen(
        (GyroscopeEvent event) {
          setState(() {
            gyroscopeValues = <double>[event.x, event.y, event.z];
          });
        }
    );

    magnetSub = magnetEvents.listen(
        (MagnetometerEvent event) {
          setState(() {
            magnetValues = <double>[event.x, event.y, event.z];
          });
        }
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userAccelSub?.cancel();
    accelSub?.cancel();
    gyroSub?.cancel();
    magnetSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    final x1 = userAccelerometerValues?[0].toStringAsFixed(2) ?? "0.0";
    final y1 = userAccelerometerValues?[1].toStringAsFixed(2) ?? "0.0";
    final z1 = userAccelerometerValues?[2].toStringAsFixed(2) ?? "0.0";
    final x2 = accelerometerValues?[0].toStringAsFixed(2) ?? "0.0";
    final y2 = accelerometerValues?[1].toStringAsFixed(2) ?? "0.0";
    final z2 = accelerometerValues?[2].toStringAsFixed(2) ?? "0.0";
    final x3 = gyroscopeValues?[0].toStringAsFixed(2) ?? "0.0";
    final y3 = gyroscopeValues?[1].toStringAsFixed(2) ?? "0.0";
    final z3 = gyroscopeValues?[2].toStringAsFixed(2) ?? "0.0";
    final x4 = magnetValues?[0].toStringAsFixed(2) ?? "0.0";
    final y4 = magnetValues?[1].toStringAsFixed(2) ?? "0.0";
    final z4 = magnetValues?[2].toStringAsFixed(2) ?? "0.0";


    return Scaffold(
      appBar: AppBar(
        title: const Text('Accel Gyro'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
              "ユーザ加速度(X右,Y上,Z画面)\n X: ${x1}\nY: ${y1}\nZ: ${z1}",
              style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "加速度(X右,Y上,Z画面)\n X: ${x2}\nY: ${y2}\nZ: ${z2}",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "ジャイロ(X:P,Y:R,Z:Y)\n X: ${x3}\nY: ${y3}\nZ: ${z3}",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "コンパス\n X: ${x4}\nY: ${y4}\nZ: ${z4}",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
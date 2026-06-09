import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

sealed class BLEState {
  final status = '基底';
  final String reason;
  BLEState(this.reason);
}

// アイドル状態
class BLEStateIdle extends BLEState {
  final status = 'アイドル';
  BLEStateIdle({
    required String reason,
  }) : super(reason);
}

class BLEStateScanning extends BLEState {
  final status = 'スキャン中';
  BLEStateScanning() : super('セントラルの実行');
}

class BLEStateConnecting extends BLEState {
  final status = '接続試行中';
  BLEStateConnecting({
    required String reason,
  }) : super(reason);
}

class BLEStateConnected extends BLEState {
  final status = '接続完了';
  BLEStateConnected() : super('接続成功');
}

class BLEStateFailedConnect extends BLEState {
  final status = '接続失敗';
  String deviceName;
  BLEStateFailedConnect({
    required String reason,
    this.deviceName = '',
  }) : super(reason);
}

class BLEStateDisconnecting extends BLEState {
  final status = '切断中';
  BLEStateDisconnecting({
    required String reason,
  }) : super(reason);
}

class BLEStateError extends BLEState {
  final status = 'BLEエラー';
  BLEStateError({
    required String reason,
  }) : super(reason);
}


// AsyncNotifier
class BLEServiceAsyncNotifier extends AsyncNotifier<BLEState> {
  List<ScanResult> _blueScanResults = []; // スキャン結果
  StreamSubscription<List<ScanResult>>? _blueSubscriber = null;

  @override
  Future<BLEState> build() async {
    ref.onDispose(() => _blueSubscriber?.cancel());
    // アイドル状態
    return BLEStateIdle(reason: '初期状態');
  }

  Future<void> doScan({int timeout = 15}) async {
    // スキャン状態
    final scan = BLEStateScanning();
    state = AsyncLoading<BLEStateScanning>().copyWithPrevious(AsyncData(scan));

    state = await AsyncValue.guard(() async {
      // 安全なスキャンの開始方法
      if (FlutterBluePlus.isScanningNow) {
        await FlutterBluePlus.stopScan();
      }

      // 2. 少しだけ待機（AndroidのBluetoothスタックを安定させるため）
      await Future.delayed(Duration(milliseconds: 500));

      debugPrint('startScan');
      await FlutterBluePlus.startScan(timeout: Duration(seconds: timeout));

      _blueSubscriber = FlutterBluePlus.scanResults.listen((results) {
        _blueScanResults = results;
        for (ScanResult r in _blueScanResults) {
          debugPrint('${r.device.platformName}(${r.device.remoteId}): ${r.device.advName} found! rssi: ${r
              .rssi}');
        }
      });

      // スキャン停止
      await FlutterBluePlus.stopScan();

      return BLEStateIdle(reason: 'スキャン完了');
    });
  }

  Future<void> cancelScan() async {
    // スキャン停止
    await FlutterBluePlus.stopScan();
    state = AsyncData(BLEStateIdle(reason: 'スキャンのキャンセル'));
  }

  // スキャン結果のゲッター
  List<ScanResult> get scanResults => _blueScanResults;

  Future<void> connect(String deviceName, { int mtu = 512 }) async {
    final connecting = BLEStateConnecting(reason: 'セントラルからの接続依頼');
    state = AsyncLoading<BLEStateConnecting>().copyWithPrevious(AsyncData(connecting));

    final scanResult = _blueScanResults.where((result) => result.device.platformName == deviceName);
    if (scanResult.isEmpty) {
      state = AsyncData(BLEStateIdle(reason: 'デバイスが見つかりません'));
      return;
    }
    if (scanResult.length > 1) {
      state = AsyncData(BLEStateError(reason: '同名のデバイスが複数あります'));
      return;
    }

    try {
      // 接続開始
      final target = scanResult.toList()[0];
      await target.device.connect(
        license: License.free,
        mtu: mtu,
        autoConnect: false,
      );

      // 接続成功
      state = AsyncData(BLEStateConnected());
      return;
    } catch (err, st) {
      state = AsyncData(BLEStateFailedConnect(reason: err.toString()));
      return;
    }
  }

  Future<void> disconnect(String deviceName) async {
    final disconnecting = BLEStateDisconnecting(reason: 'セントラルからの切断依頼');
    state = AsyncLoading<BLEStateDisconnecting>().copyWithPrevious(AsyncData(disconnecting));

    final scanResult = _blueScanResults.where((result) => result.device.advName == deviceName);
    if (scanResult.isEmpty) {
      state = AsyncData(BLEStateError(reason: 'デバイスが見つかりません'));
      return;
    }
    if (scanResult.length > 1) {
      state = AsyncData(BLEStateError(reason: '同名のデバイスが複数あります'));
      return;
    }

    try {
      await scanResult.toList()[0].device.disconnect();
      state = AsyncData(BLEStateIdle(reason: '切断完了'));
    } catch (err, st) {
      state = AsyncData(BLEStateError(reason: err.toString()));
      return;
    }
  }
}

final bleServiceAsyncNotifierProvider = AsyncNotifierProvider<BLEServiceAsyncNotifier, BLEState>(() {
    return BLEServiceAsyncNotifier();
});


// NUS Service UUID
final nusServiceUuidProvider = Provider<String>((ref) {
  return "6e400001-b5a3-f393-e0a9-e50e24dcca9e";
});

// RX Characteristic (セントラルが書き込む -> ペリフェラルが受信する)
final nusRxCharacteristicUuidProvider = Provider<String>((ref) {
  return "6e400002-b5a3-f393-e0a9-e50e24dcca9e";
});

// TX Characteristic (ペリフェラルが送信する -> セントラルが通知を受け取る)f
final nusTxCharacteristicUuidProvider = Provider<String>((ref) {
  return "6e400003-b5a3-f393-e0a9-e50e24dcca9e";
});

class BLENUSConnection {
  final BluetoothCharacteristic rx;
  final Stream<List<int>> txStream;
  BLENUSConnection(this.rx, this.txStream);
}

sealed class BLENUSState {
  String reason;
  BLENUSState(this.reason);
}
class BLENUSStateIdle extends BLENUSState {
  final status = 'アイドル';
  BLENUSStateIdle({
    required String reason,
  }) : super(reason);
}
class BLENUSStateStart extends BLENUSState {
  final status = '開始中';
  BLENUSStateStart({
    required String reason,
  }) : super(reason);
}
class BLENUMStateCommunication extends BLENUSState {
  final status = '通信中';
  BLENUMStateCommunication({
    required String reason,
  }) : super(reason);
}
class BLENUSStatePause extends BLENUSState {
  final status = '一時停止中';
  BLENUSStatePause({
    required String reason,
  }) : super(reason);
}
class BLENUSStateStop extends BLENUSState {
  final status = '停止中';
  BLENUSStateStop({
    required String reason,
  }) : super(reason);
}
class BLENUSStateResume extends BLENUSState {
  final status = '再開中';
  BLENUSStateResume({
    required String reason,
  }) : super(reason);
}
class BLENUSStateFailed extends BLENUSState {
  final status = '失敗';
  String deviceName;
  BLENUSStateFailed({
    required String reason,
    required this.deviceName,
  }) : super(reason);

}


class BLENUSAsyncNotifier extends AsyncNotifier<BLENUSState> {
  String _deviceName = '';
  late final String _serviceUUID;
  late final String _rxUUID;
  late final String _txUUID;

  @override
  Future<BLENUSState> build() async {
    _serviceUUID = ref.read(nusServiceUuidProvider);
    _rxUUID = ref.read(nusRxCharacteristicUuidProvider);
    _txUUID = ref.read(nusTxCharacteristicUuidProvider);

    return BLENUSStateIdle(reason: 'NUS (Nordic Uart Service) の初期化');
  }


  Future<BLENUSConnection?> setupNUS(String deviceName) async {
    final start = BLENUSStateStart(reason: '開始中');
    state = AsyncLoading<BLENUSStateStart>().copyWithPrevious(AsyncData(start));

    _deviceName = deviceName;
    final scanResults = ref.watch(bleServiceAsyncNotifierProvider.notifier).scanResults;

    final scanResult = scanResults.where((result) => result.device.platformName == _deviceName);
    final targetDevice = scanResult.toList()[0].device;

    List<BluetoothService> services = await targetDevice.discoverServices();

    bool hasRequiredService = false;
    bool hasRequiredTxCharacteristic = false;
    bool hasRequiredRxCharacteristic = false;
    BluetoothCharacteristic? rxCharacteristic;
    BluetoothCharacteristic? txCharacteristic;

    for (BluetoothService s in services) {
      if (s.uuid.toString().toLowerCase() == _serviceUUID) {
        // 対象サービス発見
        hasRequiredService = true;
        for (BluetoothCharacteristic c in s.characteristics) {
          if (c.uuid.toString().toLowerCase() == _rxUUID) {
            // 対象RX (Write)を発見
            hasRequiredRxCharacteristic = true;
            rxCharacteristic = c;
          } else if (c.uuid.toString().toLowerCase() == _txUUID) {
            // 対象TX (Notify)を発見
            hasRequiredTxCharacteristic = true;
            txCharacteristic = c;
          }
        }
      }
    }

    // 必要なサービスUUIDが存在するかチェック
    if (!hasRequiredService) {
      state = AsyncData(BLENUSStateFailed(
          reason: '必要なサービスが見つからない未対応デバイス. $_serviceUUID',
          deviceName: deviceName));
      await targetDevice.disconnect();
      return null;
    }

    if (!hasRequiredRxCharacteristic) {
      state = AsyncData(BLENUSStateFailed(
          reason: '必要なRX(Write)が見つからない未対応デバイス. $_rxUUID',
          deviceName: deviceName));
      await targetDevice.disconnect();
      return null;
    }

    if (!hasRequiredTxCharacteristic) {
      state = AsyncData(BLENUSStateFailed(
          reason: '必要なTX(Notify)が見つからない未対応デバイス. $_txUUID',
          deviceName: deviceName));
      await targetDevice.disconnect();
      return null;
    }

    if (rxCharacteristic != null && txCharacteristic != null) {

      // 通知（Notify）を有効にする（TXからのデータを受け取るため）
      bool ack = await txCharacteristic.setNotifyValue(true);
      if (!ack) {
        state = AsyncData(BLENUSStateFailed(
            reason: 'Notifyの有効化に失敗しました',
            deviceName: deviceName));
        await targetDevice.disconnect();
        return null;
      }

      state = await AsyncValue.guard(() async {
        debugPrint('現在のMTU: ${targetDevice.mtuNow}');
        if (Platform.isAndroid) {
          // MTUの交渉リクエストを送る. 247をリクエストしても、相手が128までしか対応してなければ128になります
          await targetDevice.requestMtu(247);
          debugPrint('現在のMTU(android): ${targetDevice.mtuNow}');
          // 特に iOS の場合、requestMtu を手動で呼ぶ必要はなく、
          // OS側が自動的に最大値（多くは185バイト前後）をネゴシエーションしてくれます。
          // 対して Android は明示的に呼び出す必要があるため、クロスプラットフォーム開発では注意が必要です。
        }

        return BLENUMStateCommunication(reason: '設定と接続が成功');
      });

      // データ受信のリスナーを設定
      return BLENUSConnection(rxCharacteristic, txCharacteristic.lastValueStream);
    }

    return null;
  }
}

final bleNUSAsyncNotifierProvider = AsyncNotifierProvider<BLENUSAsyncNotifier, BLENUSState>(() {
  return BLENUSAsyncNotifier();
});


// final bleNUSStreamProvider = StreamProvider.family<BLENUSAsyncNotifier, String>((ref, deviceName) async* {
//   BLENUSConnection? conn = await ref.read(bleNUSAsyncNotifierProvider.notifier).setupNUS(deviceName);
//
// });


class DeviceBLESerialPage extends ConsumerWidget {
  const DeviceBLESerialPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    // throw UnimplementedError();
    final bleState = ref.watch(bleServiceAsyncNotifierProvider);
    // final bleNUSState = ref.watch(bleNUSAsyncNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth(BLE)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('BLE通信状態', style: TextStyle(fontSize: 20)),
            bleState.when(
              data: (state) {
                switch (state) {
                  case BLEStateIdle():
                    return Text('アイドル状態');
                  case BLEStateScanning():
                    return Text('スキャン中');
                  case BLEStateConnecting():
                    return Text('接続中');
                  case BLEStateFailedConnect():
                    return Text('接続失敗');
                  case BLEStateConnected():
                    return Text('接続完了');
                  case BLEStateDisconnecting():
                    return Text('切断中');
                  case BLEStateError():
                    return Text('エラー');
                  default:
                    return Text(state.status);
                }
              },
              loading: () => CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Error: $error'),
            ),
            Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
                onPressed: () async {
                  await ref.read(bleServiceAsyncNotifierProvider.notifier).doScan();
                },
                child: const Text('Scan'),
            ),
            Spacer(),
          ],
        )
      )
    );
  }
}
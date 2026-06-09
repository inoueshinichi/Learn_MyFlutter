import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:isolate';


// グローバル関数
void childFuncIsolate(SendPort sendPort) {
  int i = 0;
  // 親にメッセージを送る
  Timer.periodic(const Duration(seconds: 1), (timer) => {
    sendPort.send(i++)
  });
}


class UIIsolatePage extends StatefulWidget {
  const UIIsolatePage({super.key});

  @override
  State<UIIsolatePage> createState() => UIIsolatePageState();
}


class UIIsolatePageState extends State<UIIsolatePage> {
  int counter = 0;

  void incrementCounter() async {
    var recievePort = ReceivePort();
    var sendPort = recievePort.sendPort;
    late Capability capability;

    // 子スレッドからメッセージを受け取る
    recievePort.listen((message) {
      print(message);
      setState(() {
        counter = message;
      });
    });

    // Isolate(別スレッド/シングルスレッドイベントループ)を作成
    final childIsolate = await Isolate.spawn(childFuncIsolate, sendPort);

    // 一時停止
    Timer(const Duration(seconds: 5), () {
      print('pausing');
      capability = childIsolate.pause();
    });

    // 再開
    Timer(const Duration(seconds: 10), () {
        print('resume');
        childIsolate.resume(capability);
    });

    // 終了
    Timer(const Duration(seconds: 15), () {
      print("kill");
      recievePort.close();
      childIsolate.kill();
    });



    print('MainIsolateFuncDone');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isolate'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(onPressed: incrementCounter),
    );
  }
}


import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;


class StateBlocPage extends StatefulWidget {
  const StateBlocPage({super.key});

  @override
  State<StateBlocPage> createState() => StateBlocPageState();
}


class StateBlocPageState extends State<StateBlocPage> {
  var intStreamController = StreamController<int>();
  var stringStreamController = StreamController<String>.broadcast();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocDataPublisher(intStreamController);
    BlocDataLogicComponent(intStreamController, stringStreamController);
    BlocDataSubscriber(stringStreamController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    intStreamController.close();
    stringStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLOC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Random integer',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(padding: EdgeInsets.all(20)),
            // 消費場所 No.2
            StreamBuilder<String>(
                stream: stringStreamController.stream,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
            ),
          ],
        )
      )
    );
  }
}


/* Business Logic */

// データ出版場所
class BlocDataPublisher {
  Timer? _timer; // nullableで定義

  BlocDataPublisher(StreamController<int> intStreamController) {
    // 3秒に一度、整数の乱数を作ってStream<int>に流す.
    _timer = Timer.periodic(
      const Duration(seconds: 3), (timer) {
        int data = math.Random().nextInt(100);
        debugPrint('BlocDataPublisherが$dataを送信しました');
        try {
          if (!intStreamController.isClosed) {
            // 生成場所
            intStreamController.sink.add(data);
          } else {
            timer.cancel();
          }
        } catch (e) {
          if (e is StateError) {
            // cancel timer
            timer.cancel();

            debugPrint('Stream<int>は既に閉じています');
            // intStreamController.close();
          } else {
            rethrow;
          }
        }
    });
  }
}

// データ加工場所
class BlocDataLogicComponent {
  late StreamSubscription<int> intStreamSub;

  BlocDataLogicComponent(
      StreamController<int> intStreamController,
      StreamController<String> stringStreamController) {
    // intデータをstringデータに変換
    intStreamSub = intStreamController.stream.listen((data) async {
      String strData = data.toString();
      debugPrint('BlocLogicComponentが$data(数値型)から$strData(文字列型)に変換しました');
      try {
        // 加工後、再送
        if (!stringStreamController.isClosed) {
          stringStreamController.sink.add(strData);
        }
      } catch (e) {
        if (e is StateError) {
          debugPrint('Stream<String>は既に閉じられています');
          // stringStreamController.close();
        } else {
          rethrow;
        }
      }
    });
  }
}


// データ購読場所
class BlocDataSubscriber {
  late StreamSubscription<String> stringStreamSub;

  BlocDataSubscriber(StreamController<String> stringStreamController) {
    stringStreamSub = stringStreamController.stream.listen((data) async {
      debugPrint('BlocSubscriberが$dataを受信しました'); // 消費場所 No.1
    });
  }
}


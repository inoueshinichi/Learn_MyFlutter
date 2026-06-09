import 'package:flutter/material.dart';
import 'dart:async';


class StateStreamPage extends StatefulWidget {
  const StateStreamPage({super.key});

  @override
  State<StateStreamPage> createState() => StateStreamPageState();
}


class StateStreamPageState extends State<StateStreamPage> {
  int counter = 0;

  // Stream
  late StreamController<int> counterStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counterStream = StreamController<int>.broadcast();
    StreamConsumer(counterStream);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    counterStream.close();
    super.dispose();
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
    // カウントアップ後に, Steamにカウンタ値を流す
    counterStream.sink.add(counter);
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
    counterStream.sink.add(counter);
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
    counterStream.sink.add(counter);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'カウントアップ後にStreamにcount値を流す',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200)
          ),
          Padding(padding: EdgeInsets.all(20)),
          Center(
            child: Text('Counter: $counter'),
          ),
          Padding(padding: EdgeInsets.all(20)),
          StreamBuilder<int>(
            stream: counterStream.stream,
            initialData: 0,
            builder: (context, snapshot) {
              return Text(
                'StreamBuilder: ${snapshot.data}',
                style: Theme.of(context).textTheme.headlineLarge,
              );
            },
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: incrementCounter,
            child: Icon(Icons.add),
            heroTag: null,
          ),
          Padding(padding: EdgeInsets.all(10)),
          FloatingActionButton(
            onPressed: resetCounter,
            child: Icon(Icons.reset_tv_rounded),
            heroTag: null,
          ),
          Padding(padding: EdgeInsets.all(10)),
          FloatingActionButton(
            onPressed: decrementCounter,
            child: Icon(Icons.remove),
            heroTag: null,
          ),
        ],
      ),
    );
  }
}


class StreamConsumer {
  late StreamSubscription<int> streamSub;

  StreamConsumer(StreamController<int> consumeStream) {
    // Streamをlistenしてデータが来たらターミナルに表示
    streamSub = consumeStream.stream.listen((data) async {
      debugPrint('StreamConsumerが $data を使いました');
    });
  }
}
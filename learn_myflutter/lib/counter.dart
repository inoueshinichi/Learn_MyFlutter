import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, required this.title});

  final String title;

  @override
  State<CounterPage> createState() => CounterPageState();
}


class CounterPageState extends State<CounterPage> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$counter', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  // color: Colors.blue,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    child: const Text('プラス', style: TextStyle(color: Colors.white)),
                    onPressed: () => incrementCounter(),
                  ),
                ),
                const SizedBox(width: 20.0),
                Container(
                  // color: Colors.red,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    child: const Text('マイナス', style: TextStyle(color: Colors.white)),
                    onPressed: () => decrementCounter(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              // color: Colors.black,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                child: const Text('リセット', style: TextStyle(color: Colors.white)),
                onPressed: () => resetCounter(),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
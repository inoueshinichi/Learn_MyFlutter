import 'package:flutter/material.dart';


class StateApplifecyclePage extends StatefulWidget {
  const StateApplifecyclePage({super.key});

  @override
  State<StateApplifecyclePage> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return StateApplifecyclePageState();
  }
}


class StateApplifecyclePageState
    extends State<StateApplifecyclePage>
    with WidgetsBindingObserver {

  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    debugPrint("state = $state");
    switch (state) {
      case AppLifecycleState.inactive:
        print("非アクティブになった時の処理");
        break;
      case AppLifecycleState.paused:
        print("停止された時の処理");
        break;
      case AppLifecycleState.resumed:
        print('再開された時の処理');
        break;
      case AppLifecycleState.hidden:
        print('隠れた時の処理');
        break;
      case AppLifecycleState.detached:
        print('破棄された時の処理');
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    return Scaffold(
      appBar: AppBar(
        title: const Text('AppLifeCycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter.toString(),
              style: Theme.of(context).textTheme.bodyLarge
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
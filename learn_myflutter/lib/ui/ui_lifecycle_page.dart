import 'package:flutter/material.dart';

class UILifeCyclePage extends StatefulWidget {
  final String title;
  final String message;

  const UILifeCyclePage({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  State<UILifeCyclePage> createState() => UILifeCyclePageState();
}


// データ用クラス
class Data {
  final int price;
  final String name;
  Data(this.name, this.price): super();

  @override
  String toString() {
    return '$name:$price円';
  }
}


class UILifeCyclePageState extends State<UILifeCyclePage> {
  String message = '初期値';

  // サンプルデータ
  static final data = [
    Data('Apple', 200),
    Data('MicroSoft', 250),
    Data('Google', 300),
    Data('Meta', 150),
    Data('OpenAI', 350)
  ];

  Data item = data[0];


  /** State lifecycle
   *  [0] (startpoint)
   *  [1] created
   *  [2] initialied
   *  [3] ready
   *  [4] defunct
   *  [5] (endpoint)
   */

  // State: created -> initialized
  @override
  void initState() {
    // Bellow list can be done in this state stage.
    // [1] can't invoke `dependOnInheritedWidgetOfExactType()` method with O(1)
    // for getting InheritedWidget object
    // [2] can invoke `findAncestorWidgetOfExactType()` method
    // for getting InheritedWidget object
    // but O(n). it's slowly finding.
    super.initState();
    message = widget.message;
    print('[Called] initState');
  }

  // State: initialized -> ready
  @override
  void didChangeDependencies() {
    // Called timings.
    // (1) After invoking `initState()` method.
    // (2) When invoke `dependOnInheritedWidgetOfExactType()` method in State object
    // have InheritedWidget object to my ancestors.

    // Bellow list can be done in this state stage.
    // [1] can use context object
    // [2] can invoke `dependOnInheritedWidgetOfExactType()` method with O(1)
    super.didChangeDependencies();
    print('[Called] didChangeDependencies');
  }

  // State: emitted this whenever a change of StatefulWidget that this state refers.
  // Thus; When reconstructing the StatefulWidget's parent widget
  // while pass new changed values to the StatefulWidget.
  @override
  void didUpdateWidget(UILifeCyclePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('[Called] didUpdateWidget');
  }

  // State: ready -> defunct
  // When StatfullWidget refered by this state is deleted.
  @override
  void dispose() {
    super.dispose();
    print('[Called] dispose');
  }


  void setData() {
    setState(() {
      item = (data..shuffle()).first;
    });
  }

  void setMessage() {
    setState(() {
      message = 'タップしました';
    });
  }

  @override
  Widget build(BuildContext context) {
    // ここでStatefulWidgetのプロパティを設定できる

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget LifeCycle'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              message,
              style: const TextStyle(fontSize: 32.0),
            ),
            Text(
              item.toString(),
              style: const TextStyle(fontSize: 32.0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: setMessage,
          tooltip: "set message",
          child: const Icon(Icons.star),
      ),
    );
  }

}
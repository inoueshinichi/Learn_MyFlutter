import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///////////////////
// StateNotifier //
///////////////////
class MyData extends StateNotifier<double> {
  MyData() : super(0.5);
  void changeState(state) => this.state = state;
}
final mydataProvider = StateNotifierProvider<MyData, double>((ref) => MyData());



class StateRiverpodV4Page extends StatefulWidget {
  const StateRiverpodV4Page({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return StateRiverpodV4PageState();
  }
}


class StateRiverpodV4PageState extends State<StateRiverpodV4Page> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod v4'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder: (context, ref, child) {
            return Text(
              ref.watch(mydataProvider).toStringAsFixed(2),
              style: const TextStyle(fontSize: 100),
            );
          }),
          Consumer(builder: (context, ref, child) {
            return Slider(
              value: ref.watch(mydataProvider),
              onChanged: (value) =>
                ref.read(mydataProvider.notifier).changeState(value),
            );
          }),
        ],
      ),
    );
  }
}
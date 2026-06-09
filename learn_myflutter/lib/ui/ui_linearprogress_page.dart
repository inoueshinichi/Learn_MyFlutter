import 'package:flutter/material.dart';
import 'dart:math' as math;

class UILinearProgressPage extends StatefulWidget {
  const UILinearProgressPage({super.key});

  @override
  State<UILinearProgressPage> createState() => UILinearProgressPageState();
}


class UILinearProgressPageState extends State<UILinearProgressPage> {
  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('LinearProgressIndicator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  child: LinearProgressIndicator(
                    minHeight: 30.0,
                    backgroundColor: Colors.blueGrey,
                    color: Colors.black12,
                    value: progress,
                  ),
                ),
                Align(
                  child: Text(
                    '残り${((1 - progress) * 100).toStringAsFixed(1)}%',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  // alignment: Alignment.center,
                ),
              ],
            ),
            // Padding(padding: EdgeInsets.all(10)),
            // ListView(
            //   children: [1,2,3].map((int index) => SwitchListTile(
            //       title: Text(index.toString(), style: TextStyle(color: Colors.black)),
            //       value: math.Random().nextBool(),
            //       onChanged: (bool value) {},
            //       secondary: Icon(Icons.arrow_forward_rounded, color: Colors.blueGrey),
            //     )
            //   ).toList(),
            // ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (progress < 0) progress = 0.0;
              if (progress >= 1) progress = 1.0;
              progress += 0.1;
            });
          }),
    );
  }
}
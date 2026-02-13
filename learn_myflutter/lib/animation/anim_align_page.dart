import 'package:flutter/material.dart';

class AnimAlignPage extends StatefulWidget {
  const AnimAlignPage({super.key});

  @override
  State<AnimAlignPage> createState() => AnimAlignPageState();
}


class AnimAlignPageState extends State<AnimAlignPage> {
  bool flg = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Align", style: TextStyle(fontSize: 30.0)),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            AnimatedAlign(
              alignment: flg ? Alignment.topLeft : Alignment.topRight,
              duration: const Duration(seconds: 2),
              child: Container(
                color: Colors.deepPurpleAccent,
                width: 100,
                height: 100,
              ),
              curve: Curves.linear,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              flg = !flg;
            });
          },
          child: const Icon(Icons.access_time_outlined),
      ),
    );
  }
}
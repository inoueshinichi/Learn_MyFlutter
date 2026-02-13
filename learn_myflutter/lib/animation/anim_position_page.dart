import 'package:flutter/material.dart';


class AnimPositionPage extends StatefulWidget {
  const AnimPositionPage({super.key});

  @override
  State<AnimPositionPage> createState() => AnimPositionPageState();
}


class AnimPositionPageState extends State<AnimPositionPage> {
  bool flg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Position', style: TextStyle(fontSize: 30.0)),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
              child: Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              duration: Duration(seconds: 3),
            top: flg ? 300 : 0,
            left: flg ? 0 : 300,
          ),
        ],
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
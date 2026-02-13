import 'package:flutter/material.dart';

class AnimContainerPage extends StatefulWidget {
  const AnimContainerPage({super.key});

  @override
  State<AnimContainerPage> createState() => AnimContainerPageState();
}


class AnimContainerPageState extends State<AnimContainerPage> {
  bool flg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container', style: TextStyle(fontSize: 30.0)),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              color: flg ? Colors.red : Colors.yellow,
              width: flg ? 100 : 300,
              height: flg ? 300 : 100,
            ),
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
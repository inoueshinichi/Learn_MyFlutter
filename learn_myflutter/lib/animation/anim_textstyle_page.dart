import 'package:flutter/material.dart';


class AnimTextStylePage extends StatefulWidget {
  const AnimTextStylePage({super.key});

  @override
  State<AnimTextStylePage> createState() => AnimTextStylePageState();
}


class AnimTextStylePageState extends State<AnimTextStylePage> {
  bool flg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated StyleText', style: TextStyle(fontSize: 30.0)),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            AnimatedDefaultTextStyle(
                child: Text("Hello Flutter!"),
                style: TextStyle(
                  fontSize: flg ? 48 : 96,
                  fontWeight: FontWeight.bold,
                  color: flg ? Colors.red : Colors.blue,
                ),
                duration: const Duration(seconds: 2),
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
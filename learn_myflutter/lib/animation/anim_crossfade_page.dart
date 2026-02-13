import 'package:flutter/material.dart';

class AnimCrossFadePage extends StatefulWidget {
  const AnimCrossFadePage({super.key});

  @override
  State<AnimCrossFadePage> createState() => AnimCrossFadePageState();
}


class AnimCrossFadePageState extends State<AnimCrossFadePage> {
  bool flg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated CrossFade', style: TextStyle(fontSize: 30.0)),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            AnimatedCrossFade(
                firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 300.0),
                secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 300.0),
                crossFadeState: flg ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: const Duration(seconds: 1),
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
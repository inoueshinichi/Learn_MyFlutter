import 'dart:math';
import 'package:flutter/material.dart';

class AnimBuilderPage extends StatefulWidget {
  const AnimBuilderPage({super.key});

  @override
  State<AnimBuilderPage> createState() => AnimBuilderPageState();
}


class AnimBuilderPageState extends State<AnimBuilderPage>
  with TickerProviderStateMixin {
  late AnimationController animController;
  late Animation anim;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1)
    );

    anim = animController.drive(Tween(begin: 0.0, end: 2.0 * pi));
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  Future<void> forward() async {
    setState(() {
      animController.forward();
    });
  }

  Future<void> stop() async {
    setState(() {
      animController.stop();
    });
  }

  Future<void> reverse() async {
    setState(() {
      animController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Builder'),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: anim,
            builder: (context, _) {
              return Transform.rotate(
                angle: anim.value,
                child: const Icon(Icons.cached, size: 100),
              );
            },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: forward,
            child: const Icon(Icons.arrow_forward),
            heroTag: null,
          ),
          FloatingActionButton(
            onPressed: stop,
            child: const Icon(Icons.pause),
            heroTag: null,
          ),
          FloatingActionButton(
            onPressed: reverse,
            child: const Icon(Icons.arrow_back),
            heroTag: null,
          ),
        ],
      ),
    );
  }
}
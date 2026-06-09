import 'package:flutter/material.dart';


class AnimTween2Page extends StatefulWidget {
  const AnimTween2Page({super.key});

  @override
  State<AnimTween2Page> createState() => AnimTween2PageState();
}


class AnimTween2PageState extends State<AnimTween2Page>
    with TickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> animDouble;
  final Tween<double> tweenDouble = Tween(begin: 0.0, end: 200.0);
  late Animation<Color?> animColor;
  final ColorTween tweenColor = ColorTween(begin: Colors.green, end: Colors.red);

  @override
  void initState() {
    super.initState();

    animController = AnimationController(
        vsync: this, duration: const Duration(seconds: 3));

    animDouble = tweenDouble.animate(animController);
    animDouble.addListener(() {
      setState(() {});
    });

    animColor = tweenColor.animate(animController);
    animColor.addListener(() {
      setState(() {});
    });
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
        title: const Text('Tween2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("AnimationController: ${animController.value}"),
            Text("AnimationDouble: ${animDouble.value}"),
            Text("AnimationColor: ${animColor.value}"),
            SizeTransition(
              sizeFactor: animController,
              child: Center(
                child: SizedBox(
                  width: animDouble.value,
                  height: animDouble.value,
                  child: Container(color: animColor.value),
                ),
              ),
            ),
          ],
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
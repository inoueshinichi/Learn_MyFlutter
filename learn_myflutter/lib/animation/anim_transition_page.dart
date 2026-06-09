import 'package:flutter/material.dart';


class AnimTransitionPage extends StatefulWidget {
  const AnimTransitionPage({super.key});

  @override
  State<AnimTransitionPage> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return AnimTransitionPageState();
  }
}


class AnimTransitionPageState extends State<AnimTransitionPage>
    with TickerProviderStateMixin {
  late AnimationController animController;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3));
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transition'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizeTransition(
                sizeFactor: animController,
                child: Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Container(color: Colors.amber),
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
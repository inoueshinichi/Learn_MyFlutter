import 'package:flutter/material.dart';

class AnimAnimatedPage extends StatefulWidget {
  const AnimAnimatedPage({super.key});

  @override
  State<AnimAnimatedPage> createState() {
    return AnimAnimatedPageState();
  }
}


class AnimAnimatedPageState extends State<AnimAnimatedPage> {
  bool flag = false;

  Future<void> click() async {
    setState(() {
      flag = !flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: flag ? 1.0 : 0.1,
              duration: const Duration(seconds: 3),
              child: Text(
                '消える文字',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            AnimatedSize(
              duration: const Duration(seconds: 3),
              child: SizedBox(
                width: flag ? 50 : 200,
                height: flag ? 50 : 200,
                child: Container(color: Colors.deepPurpleAccent),
              ),
            ),
            AnimatedAlign(
                alignment: flag ? Alignment.topLeft : Alignment.bottomRight,
                duration: const Duration(seconds: 3),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Container(color: Colors.lightGreenAccent),
                ),
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 3),
              width: flag ? 100 : 50,
              height: flag ? 50 : 100,
              padding: flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
              margin:  flag ? const EdgeInsets.all(0) : const EdgeInsets.all(30),
              transform: flag ? Matrix4.skewX(0.0) : Matrix4.skewX(0.3),
              color: flag ? Colors.blue : Colors. grey,
            ),
            AnimatedSwitcher(
                duration: const Duration(seconds: 3),
                child: flag ? const Icon(Icons.scatter_plot) : const Icon(Icons.facebook),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: click,
            child: const Icon(Icons.start),
          ),
        ],
      ),
    );
  }
}


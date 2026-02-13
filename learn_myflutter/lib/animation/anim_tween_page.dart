import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimTweenPage extends StatefulWidget {
  const AnimTweenPage({super.key});

  @override
  State<AnimTweenPage> createState() => AnimTweenPageState();
}


class AnimTweenPageState extends State<AnimTweenPage>
  with SingleTickerProviderStateMixin
{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this, /* SingleTicker */
    );
    animation = Tween<double>(begin: 0, end: math.pi)
      .animate(controller)
      ..addListener(() {
        setState(() {
          // pass
        });
      });

    controller.repeat(reverse: false);
    // controller.forward();
    // controller.reverse();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      backgroundColor: Color.fromARGB(255,255,255,255),
      appBar: AppBar(
        title: Text('Animation Tween', style: TextStyle(fontSize: 30.0)),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 300,
              height: 300,
              child: CustomPaint(
                painter: AnimTweenPainter(animation.value),
                child: Center(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class AnimTweenPainter extends CustomPainter {
  final double value;

  AnimTweenPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    canvas.save();

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(100, 255, 0, 255);
    Rect r = Rect.fromLTWH(0,0,255,255);
    canvas.translate(150,150);
    canvas.rotate(value);
    canvas.translate(-125,-125);
    canvas.drawRect(r,p);

    canvas.restore();
    p.style = PaintingStyle.stroke;
    p.strokeWidth = 25;
    p.color = Color.fromARGB(100,0,255,255);
    r = Rect.fromLTWH(0,0,255,255);
    canvas.translate(150,150);
    canvas.rotate(value * -1);
    canvas.translate(-125, -125);
    canvas.drawRect(r,p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return true;
  }
}
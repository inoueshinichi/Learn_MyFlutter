import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

class GraphicsEventPage extends StatefulWidget {
  const GraphicsEventPage({super.key});

  @override
  State<GraphicsEventPage> createState() => GraphicsEventPageState();
}


class GraphicsEventPageState extends State<GraphicsEventPage> {
  static List<Offset> points = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,255,255,255),
      appBar: AppBar(
        title: Text('Graphics Event', style: TextStyle(fontSize: 30.0)),
      ),
      body: Center(
        child: Listener(
          onPointerDown: (PointerDownEvent event) => {
            setState(() {
              points.add(event.localPosition);
            })
          },
          onPointerUp: (PointerUpEvent event) => {},
          onPointerMove: (PointerMoveEvent event) => {},
          onPointerHover: (PointerHoverEvent event) => {},
          onPointerPanZoomStart: (PointerPanZoomStartEvent event) => {},
          onPointerPanZoomEnd: (PointerPanZoomEndEvent event) => {},
          onPointerPanZoomUpdate: (PointerPanZoomUpdateEvent event) => {},
          onPointerCancel: (PointerCancelEvent event) => {},
          child: CustomPaint(
            painter: GraphicsEventPainter(points: points),
            child: Center(),
          ),
        ),
      ),
    );
  }
}


class GraphicsEventPainter extends CustomPainter {
  final List<Offset> points;

  GraphicsEventPainter({required this.points});

  void myPaint1(Canvas canvas, Size size) {
    Paint p = Paint();

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(100, 0, 200, 100);
    for (var pos in points) {
      Rect r = Rect.fromLTWH(pos.dx-25, pos.dy-25, 50.0, 50.0);
      canvas.drawOval(r, p);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    myPaint1(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
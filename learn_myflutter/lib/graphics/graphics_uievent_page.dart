import 'package:flutter/material.dart';

class GraphicsUIEventPage extends StatefulWidget {
  const GraphicsUIEventPage({super.key});

  @override
  State<GraphicsUIEventPage> createState() => GraphicsUIEventPageState();
}


class GraphicsUIEventPageState extends State<GraphicsUIEventPage> {
  static double value = 0;
  static double opaq = 0;

  @override
  void initState() {
    super.initState();
  }

  void changeVal(double v) {
    setState(() {
      value = v;
    });
  }

  void changeOpaq(double v) {
    setState(() {
      opaq = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      backgroundColor: Color.fromARGB(255,255,255,255),
      appBar: AppBar(
        title: Text(
            'UI Event Graphics',
            style: TextStyle(fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 300,
              height: 300,
              child: CustomPaint(
                painter: GraphicsUIEventPainter(value, opaq.toInt()),
                child: Center(),
              ),
            ),
            Slider(
              min: 0.0,
              max: 300.0,
              value: value,
              onChanged: changeVal,
            ),
            Slider(
              min: 0.0,
              max: 255.0,
              value: opaq,
              onChanged: changeOpaq,
            ),
          ],
        ),
      ),
    );
  }
}


class GraphicsUIEventPainter extends CustomPainter {
  final double value;
  final int opaq;

  GraphicsUIEventPainter(this.value, this.opaq);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(opaq, 0, 200, 100);
    Rect r = Rect.fromLTWH(
        (size.width-value)/2,
        (size.height-value)/2,
        value,
        value);
    canvas.drawOval(r, p);

    r = Rect.fromLTWH(0, 0, size.width, size.height);
    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(255, 100, 100, 100);
    canvas.drawRect(r, p);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
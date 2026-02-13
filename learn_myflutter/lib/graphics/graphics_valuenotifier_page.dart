import 'package:flutter/material.dart';


class GraphicsValueNotifierPage extends StatefulWidget {
  const GraphicsValueNotifierPage({super.key});

  @override
  State<GraphicsValueNotifierPage> createState() => GraphicsValueNotifierPageState();
}


class GraphicsValueNotifierPageState extends State<GraphicsValueNotifierPage> {
  static ValueNotifier<int> value = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      backgroundColor: Color.fromARGB(255,255,255,255),
      appBar: AppBar(
        title: Text('Graphics ValueNotifier', style: TextStyle(fontSize: 30.0)),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Container(

              width: 300,
              height: 300,
              child: CustomPaint(
                painter: GraphicsValueNotifierPainter(value),
                child: Center(),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            ElevatedButton(
              child: Text('Click', style: TextStyle(fontSize: 32)),
              onPressed: () => value.value++,
            ),
          ],
        ),
      ),
    );
  }
}


class GraphicsValueNotifierPainter extends CustomPainter {
  final ValueNotifier<int> value;

  GraphicsValueNotifierPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(50,0,255,255);
    Rect r;
    for (var i = 0; i < value.value; i++) {
      r = Rect.fromLTWH(10+i*20, 10+i*20, 100, 100);
      canvas.drawRect(r,p);
    }

    r = Rect.fromLTWH(0,0, size.width, size.height);
    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(255,100,100,100);
    canvas.drawRect(r,p);
    if (value.value > 10) value.value = 0;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
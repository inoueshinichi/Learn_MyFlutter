import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

class GraphicsPaintPage extends StatefulWidget {
  const GraphicsPaintPage({super.key});

  @override
  State<GraphicsPaintPage> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return GraphicsPaintPageState();
  }
}


class GraphicsPaintPageState extends State<GraphicsPaintPage> {
  int indexPaint = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
            'Paint Graphics',
            style: TextStyle(fontSize: 30),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                // crossAxisSpacing: 24,
                // mainAxisSpacing: 24,
                // padding: const EdgeInsets.symmetric(vertical: 24),
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() { indexPaint = 0; }),
                    child: const Text('Rect'),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() { indexPaint = 1; }),
                    child: const Text('Circle'),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() { indexPaint = 2; }),
                    child: const Text('Line'),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() { indexPaint = 3; }),
                    child: const Text('Text'),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() { indexPaint = 4; }),
                    child: const Text('Path'),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() { indexPaint = 5; }),
                    child: const Text('Transform'),
                  ),
                ],
              ),
            ),
            CustomPaint(
              painter: GraphicsPainter(indexPaint: indexPaint),
            ),
          ],
        )
      ),
    );
  }
}


class GraphicsPainter extends CustomPainter {
  final int indexPaint;

  GraphicsPainter({required this.indexPaint});


  void myPaintRect(Canvas canvas, Size size) {
    Paint p = Paint();

    // 塗りつぶしの正方形
    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(150,0,200,255);
    Rect r = Rect.fromLTWH(50.0,50.0,150.0,150.0);
    canvas.drawRect(r,p);

    // 輪郭塗の正方形
    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(150,200,0,255);
    p.strokeWidth = 10.0;
    r = Rect.fromLTWH(100.0,100.0,150.0,150.0);
    canvas.drawRect(r,p);
  }

  void myPaintCircle(Canvas canvas, Size size) {
    Paint p = Paint();

    // 正円
    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(150, 0, 200, 255);
    Offset ctr = Offset(100.0, 100.0);
    canvas.drawCircle(ctr, 75.0, p);

    // 楕円1
    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(150, 200, 0, 255);
    p.strokeWidth = 10.0;
    Rect r = Rect.fromLTWH(100.0, 50.0, 200.0, 150.0);
    canvas.drawOval(r,p);
  }

  void myPaintLine(Canvas canvas, Size size) {
    Paint p = Paint();

    p.style = PaintingStyle.stroke;
    p.strokeWidth = 5.0;
    p.color = Color.fromARGB(150, 0, 200, 255);
    for (var i = 0; i <= 10; i++) {
      Rect r = Rect.fromLTRB(
        50.0 + 20*i, 50.0,
        50.0, 250.0 - 20*i
      );
      canvas.drawLine(r.topLeft, r.bottomRight, p);
    }
  }

  void myPaintText(Canvas canvas, Size size) {
    Paint p = Paint();

    ui.ParagraphBuilder builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(textDirection: TextDirection.ltr),
    )
      ..pushStyle(ui.TextStyle(color: Colors.red, fontSize: 48.0))
      ..addText('Hello! ')
      ..pushStyle(ui.TextStyle(color: Colors.blue[700], fontSize: 30.0))
      ..addText('This is a sample of paragraph text. ')
      ..pushStyle(ui.TextStyle(color: Colors.blue[200], fontSize: 30.0))
      ..addText('You can draw MULTI-FONT text!');

    ui.Paragraph paragraph = builder.build()
      ..layout(ui.ParagraphConstraints(width: 300.0));

    Offset off = Offset(50.0, 50.0);
    canvas.drawParagraph(paragraph, off);
  }

  void myPaintPath(Canvas canvas, Size size) {
    Path path = Path();
    Rect r = Rect.fromLTWH(50.0, 50.0, 75.0, 75.0);
    path.addOval(r);
    r = Rect.fromLTWH(75.0, 75.0, 125.0, 125.0);
    path.addOval(r);
    r = Rect.fromLTWH(125.0, 125.0, 175.0, 175.0);
    path.addOval(r);

    Paint p = Paint();
    p.color = Color.fromARGB(150, 255, 0, 0);
    p.style = PaintingStyle.fill;
    canvas.drawPath(path, p);
  }

  void myPaintTransform(Canvas canvas, Size size) {
    Path path = Path();
    Rect r = Rect.fromLTWH(50.0, 50.0, 75.0, 75.0);
    path.addOval(r);
    r = Rect.fromLTWH(75.0, 75.0, 125.0, 125.0);
    path.addOval(r);
    r = Rect.fromLTWH(125.0, 125.0, 175.0, 175.0);
    path.addOval(r);

    canvas.save(); // 現在の状態を保存

    Paint p = Paint();
    p.color = Color.fromARGB(150, 255, 0, 0);
    p.style = PaintingStyle.fill;
    canvas.drawPath(path, p);

    // 描画座標系を変更して描画
    canvas.translate(0.0, 100.0);
    p.color = Color.fromARGB(150, 0, 0, 255);
    canvas.drawPath(path, p);

    p.color = Color.fromARGB(150, 0, 255, 0);
    canvas.rotate(-0.5 * math.pi);
    canvas.translate(-400.0, 50.0);
    canvas.scale(1 * 0.7);
    canvas.drawPath(path, p);

    canvas.restore(); // もとの状態に戻す
  }

  @override
  void paint(Canvas canvas, Size size) {
    switch (indexPaint) {
      case 0:
        myPaintRect(canvas, size);
        break;
      case 1:
        myPaintCircle(canvas, size);
        break;
      case 2:
        myPaintLine(canvas, size);
        break;
      case 3:
        myPaintText(canvas, size);
        break;
      case 4:
        myPaintPath(canvas, size);
        break;
      case 5:
        myPaintTransform(canvas, size);
      default:
        myPaintText(canvas, size);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return true;
  }
}
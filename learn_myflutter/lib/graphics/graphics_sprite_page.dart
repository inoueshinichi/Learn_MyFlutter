import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

class GraphicsSpritePage extends StatefulWidget {
  const GraphicsSpritePage({super.key});

  @override
  State<GraphicsSpritePage> createState() => GraphicsSpritePageState();
}


class GraphicsSpritePageState extends State<GraphicsSpritePage> {
  static ui.Image? img = null;
  static bool flg = false;

  Future<void> loadAssetImage(String fname) async {
    final bd = await rootBundle.load("assets/images/$fname");
    final Uint8List u8list = await Uint8List.view(bd.buffer);
    final codec = await ui.instantiateImageCodec(u8list);
    final frameInfo = await codec.getNextFrame();
    img = frameInfo.image;
    setState(() => flg = true);
  }

  @override
  Widget build(BuildContext context) {
    loadAssetImage('nekosan.png');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Graphics Sprite', style: TextStyle(fontSize: 30.0),
        ),
      ),
      body: Container(
        child: CustomPaint(
          painter: GraphicsSpritePainter(img),
        ),
      ),
    );
  }
}


class GraphicsSpritePainter extends CustomPainter {
  ui.Image? img = null;

  GraphicsSpritePainter(this.img);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();

    Offset off = Offset(50.0, 50.0);
    final img = this.img;
    if (img != null) {
      canvas.drawImage(img, off, p);

      // 描画元の領域
      Rect r0 = Rect.fromLTWH(0.0, 0.0,
                              img.width.toDouble(),
                              img.height.toDouble());

      // 描画先の領域
      Rect r = Rect.fromLTWH(50.0, 250.0, 200.0, 100.0);
      canvas.drawImageRect(img, r0, r, p);

      r = Rect.fromLTWH(250.0, 50.0, 100.0, 200.0);
      canvas.drawImageRect(img, r0, r, p);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
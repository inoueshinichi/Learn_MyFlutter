import 'package:flutter/material.dart';
import 'package:learn_myflutter/graphics/graphics_event_page.dart';
import 'package:learn_myflutter/graphics/graphics_paint_page.dart';
import 'package:learn_myflutter/graphics/graphics_sprite_page.dart';
import 'package:learn_myflutter/graphics/graphics_uievent_page.dart';
import 'package:learn_myflutter/graphics/graphics_valuenotifier_page.dart';


class GraphicsEntryPage extends StatelessWidget {
  const GraphicsEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graphics'),
      ),
      body: GraphicsGridMenuView(),
    );
  }
}

class GraphicsGridMenuView extends StatelessWidget {
  const GraphicsGridMenuView({super.key});

  void navPaintPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const GraphicsPaintPage(),
      ),
    );
  }

  void navSpritePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const GraphicsSpritePage(),
      ),
    );
  }
  
  void navEventPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const GraphicsEventPage(),
      ),
    );
  }

  void navUIEventPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const GraphicsUIEventPage(),
      ),
    );
  }

  void navValueNotifierPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const GraphicsValueNotifierPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 5,
        shrinkWrap: true,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: <Widget>[
          ElevatedButton(
            onPressed: () => navPaintPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('A'),
          ),
          ElevatedButton(
            onPressed: () => navSpritePage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('B'),
          ),
          ElevatedButton(
            onPressed: () => navEventPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('C'),
          ),
          ElevatedButton(
            onPressed: () => navUIEventPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('D'),
          ),
          ElevatedButton(
            onPressed: () => navValueNotifierPage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('E'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('F'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('G'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('H'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('I'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('J'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('K'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('L'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('M'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('N'),
          ),ElevatedButton(
            onPressed: () => {},
            child: const Text('O'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('P'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('Q'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('R'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('S'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('T'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('U'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('V'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('W'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('X'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('Y'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('Z'),
          ),
        ]
    );
  }
}
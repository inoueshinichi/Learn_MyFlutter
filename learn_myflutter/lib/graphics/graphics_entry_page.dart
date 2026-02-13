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
            child: const Text('A'),
          ),
          ElevatedButton(
            onPressed: () => navSpritePage(context),
            child: const Text('B'),
          ),
          ElevatedButton(
            onPressed: () => navEventPage(context),
            child: const Text('C'),
          ),
          ElevatedButton(
            onPressed: () => navUIEventPage(context),
            child: const Text('D'),
          ),
          ElevatedButton(
            onPressed: () => navValueNotifierPage(context),
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
        ]
    );
  }
}
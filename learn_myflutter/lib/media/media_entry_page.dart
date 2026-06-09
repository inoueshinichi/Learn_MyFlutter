import 'package:flutter/material.dart';
import 'package:learn_myflutter/media/media_image_page.dart';


class MediaEntryPage extends StatelessWidget {
  const MediaEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media'),
      ),
      body: MediaGridMenuView(),
    );
  }
}

class MediaGridMenuView extends StatelessWidget {
  const MediaGridMenuView({super.key});

  void navImagePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MediaImagePage()),
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
            onPressed: () => navImagePage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('A'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('B'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('C'),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('D'),
          ),
          ElevatedButton(
            onPressed: () => {},
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
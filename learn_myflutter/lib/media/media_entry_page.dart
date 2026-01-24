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
        ]
    );
  }
}
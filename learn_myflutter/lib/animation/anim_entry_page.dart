import 'package:flutter/material.dart';
import 'package:learn_myflutter/animation/anim_align_page.dart';
import 'package:learn_myflutter/animation/anim_container_page.dart';
import 'package:learn_myflutter/animation/anim_crossfade_page.dart';
import 'package:learn_myflutter/animation/anim_position_page.dart';
import 'package:learn_myflutter/animation/anim_textstyle_page.dart';
import 'package:learn_myflutter/animation/anim_tween_page.dart';


class AnimEntryPage extends StatelessWidget {
  const AnimEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: AnimGridMenuView(),
    );
  }
}

class AnimGridMenuView extends StatelessWidget {
  const AnimGridMenuView({super.key});
  
  void navAnimTween(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const AnimTweenPage()
      ),
    );
  }

  void navAnimAlign(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (BuildContext context) => const AnimAlignPage(),
      ),
    );
  }

  void navAnimTextStyle(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const AnimTextStylePage(),
      ),
    );
  }

  void navAnimPosition(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const AnimPositionPage(),
      ),
    );
  }

  void navAnimCrossFade(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const AnimCrossFadePage(),
      ),
    );
  }

  void navAnimContainer(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const AnimContainerPage(),
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
            onPressed: () => navAnimTween(context),
            child: const Text('A'),
          ),
          ElevatedButton(
            onPressed: () => navAnimAlign(context),
            child: const Text('B'),
          ),
          ElevatedButton(
            onPressed: () => navAnimTextStyle(context),
            child: const Text('C'),
          ),
          ElevatedButton(
            onPressed: () => navAnimPosition(context),
            child: const Text('D'),
          ),
          ElevatedButton(
            onPressed: () => navAnimCrossFade(context),
            child: const Text('E'),
          ),
          ElevatedButton(
            onPressed: () => navAnimContainer(context),
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
import 'package:flutter/material.dart';
import 'package:learn_myflutter/animation/anim_align_page.dart';
import 'package:learn_myflutter/animation/anim_animated_page.dart';
import 'package:learn_myflutter/animation/anim_builder_page.dart';
import 'package:learn_myflutter/animation/anim_container_page.dart';
import 'package:learn_myflutter/animation/anim_crossfade_page.dart';
import 'package:learn_myflutter/animation/anim_position_page.dart';
import 'package:learn_myflutter/animation/anim_textstyle_page.dart';
import 'package:learn_myflutter/animation/anim_transition_page.dart';
import 'package:learn_myflutter/animation/anim_tween2_page.dart';
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

  void navAnimAnimated(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (BuildContext context) => const AnimAnimatedPage(),
      ),
    );
  }

  void navAnimTransition(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const AnimTransitionPage(),
      ),
    );
  }

  void navAnimTween2(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (BuildContext context) => const AnimTween2Page(),
      ),
    );
  }

  void navAnimBuilder(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (BuildContext context) => const AnimBuilderPage(),
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
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('A'),
          ),
          ElevatedButton(
            onPressed: () => navAnimAlign(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('B'),
          ),
          ElevatedButton(
            onPressed: () => navAnimTextStyle(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('C'),
          ),
          ElevatedButton(
            onPressed: () => navAnimPosition(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('D'),
          ),
          ElevatedButton(
            onPressed: () => navAnimCrossFade(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('E'),
          ),
          ElevatedButton(
            onPressed: () => navAnimContainer(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('F'),
          ),
          ElevatedButton(
            onPressed: () => navAnimAnimated(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('G'),
          ),
          ElevatedButton(
            onPressed: () => navAnimTransition(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('H'),
          ),
          ElevatedButton(
            onPressed: () => navAnimTween2(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('I'),
          ),
          ElevatedButton(
            onPressed: () => navAnimBuilder(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
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
import 'package:flutter/material.dart';
import 'package:learn_myflutter/state/state_applifecycle_page.dart';
import 'package:learn_myflutter/state/state_bloc_page.dart';
import 'package:learn_myflutter/state/state_riverpod_v4_page.dart';
import 'package:learn_myflutter/state/state_stream_page.dart';
import 'package:learn_myflutter/state/state_riverpod_v1_page.dart';
import 'package:learn_myflutter/state/state_riverpod_v2_page.dart';
import 'package:learn_myflutter/state/state_riverpod_v3_page.dart';


class StateEntryPage extends StatelessWidget {
  const StateEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State'),
      ),
      body: StateGridMenuView(),
    );
  }
}

class StateGridMenuView extends StatelessWidget {
  const StateGridMenuView({super.key});

  void navRiverpodV1Page(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const StateRiverpodV1Page(),
      ),
    );
  }

  void navRiverpodV2Page(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const StateRiverpodV2Page(),
      ),
    );
  }

  void navRiverpodV3Page(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const StateRiverpodV3Page(),
      ),
    );
  }

  void navStreamPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const StateStreamPage(),
      ),
    );
  }

  void navBlocPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const StateBlocPage(),
      ),
    );
  }

  void navRiverpodV4Page(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const StateRiverpodV4Page(),
      ),
    );
  }

  void navAppLifeCyclePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const StateApplifecyclePage(),
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
            onPressed: () => navRiverpodV1Page(context),
            child: const Text('A'),
          ),
          ElevatedButton(
            onPressed: () => navRiverpodV2Page(context),
            child: const Text('B'),
          ),
          ElevatedButton(
            onPressed:() => navRiverpodV3Page(context),
            child: const Text('C'),
          ),
          ElevatedButton(
            onPressed: () => navStreamPage(context),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                  if (states.contains(WidgetState.pressed)) return Colors.deepOrange; // 押下中
                  if (states.contains(WidgetState.disabled)) return Colors.grey;    // 無効時
                  return Colors.blue; // 通常時
                },
              ),
            ),
            child: const Text('D'),
          ),
          ElevatedButton(
            onPressed: () => navBlocPage(context),
            style: ElevatedButton.styleFrom(
              // 最小サイズ（横幅, 高さ）
              // minimumSize: const Size(200, 50),
              // 角の丸み
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              // 枠線を付けたい場合
              side: const BorderSide(color: Colors.red, width: 2),
            ),
            child: const Text('E'),
          ),
          ElevatedButton(
            onPressed: () => navRiverpodV4Page(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
            child: const Text('F'),
          ),
          ElevatedButton(
            onPressed: () => navAppLifeCyclePage(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 背景色
              foregroundColor: Colors.white, // 文字やアイコンの色
              shadowColor: Colors.black,    // 影の色
              elevation: 5,                 // 影の高さ
            ),
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
        ],
    );
  }
}
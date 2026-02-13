import 'package:flutter/material.dart';
import 'package:learn_myflutter/setting/setting_env_page.dart';
import 'package:learn_myflutter/setting/setting_localize_page.dart';


class SettingEntryPage extends StatelessWidget {
  const SettingEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: SettingGridMenuView(),
    );
  }
}

class SettingGridMenuView extends StatelessWidget {
  const SettingGridMenuView({super.key});

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
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const SettingLocalizePage(),
                ),
              );
            },
            child: const Text('A'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingEnvPage(),
                ),
              );
            },
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
        ],
    );
  }
}
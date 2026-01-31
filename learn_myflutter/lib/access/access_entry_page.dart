import 'package:flutter/material.dart';
import 'package:learn_myflutter/access/access_webapi_page.dart';


class AccessEntryPage extends StatelessWidget {
  const AccessEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Access'),
      ),
      body: AccessGridMenuView(),
    );
  }
}

class AccessGridMenuView extends StatelessWidget {
  const AccessGridMenuView({super.key});

  void navWebAPIPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AccessWebAPIPage()),
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
            onPressed: () => navWebAPIPage(context),
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
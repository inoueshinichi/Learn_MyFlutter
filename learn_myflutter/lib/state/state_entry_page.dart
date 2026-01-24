import 'package:flutter/material.dart';


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
            onPressed: () => {},
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
import 'package:flutter/material.dart';

class ElementKeyPage extends StatefulWidget {
  const ElementKeyPage({super.key});

  @override
  State<ElementKeyPage> createState() => ElementKeyPageState();
}


class ElementKeyPageState extends State<ElementKeyPage> {
  final list = List.generate(5, (index) => index);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Element Key'),
      ),
      body: Column(
        children: list.map((element) {
          return ElementKeyListItem(
              key: ValueKey(element),
              widgetIndex: element,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              debugPrint('Swap first and last element.');
              final value = list.removeAt(0);
              list.add(value);
            });
          },
        child: const Icon(Icons.swap_vert),
      ),
    );
  }
}


class ElementKeyListItem extends StatefulWidget {
  const ElementKeyListItem({super.key, required this.widgetIndex});

  final int widgetIndex;

  @override
  State<ElementKeyListItem> createState() => ElementKeyListItemState();
}


class ElementKeyListItemState extends State<ElementKeyListItem> {
  static int counter = 0;

  final int stateIndex = counter++;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return ListTile(
      title: Text('Widget index ${widget.widgetIndex}, State index $stateIndex'),
    );
  }
}
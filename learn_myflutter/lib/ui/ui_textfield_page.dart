import 'package:flutter/material.dart';

class UITextFieldPage extends StatefulWidget {
  const UITextFieldPage({super.key});

  @override
  State<UITextFieldPage> createState() => UITextFieldPageState();
}


class UITextFieldPageState extends State<UITextFieldPage> {
  final controller = TextEditingController();
  String fieldText = '';
  List<String> list = [];

  @override
  void initState() {
    super.initState();
    controller.text = '初期値';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              onChanged: (String value) {
                print(value);
                setState(() {
                  fieldText = value;
                });
              }
            ),
            SizedBox(height: 25),
            Text('$fieldText', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(onPressed: () {
                if (controller.text.isEmpty == false) {
                  setState(() {
                    list.add(controller.text);
                    controller.clear();
                    FocusScope.of(context).unfocus();
                  });
                }
              },
              child: const Text('保存'),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.circle),
                    title: Text(list[index]),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
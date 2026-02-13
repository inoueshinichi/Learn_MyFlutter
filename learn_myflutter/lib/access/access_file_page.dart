import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class AccessFilePage extends StatefulWidget {
  const AccessFilePage({super.key});

  @override
  State<AccessFilePage> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return AccessFilePageState();
  }
}


class AccessFilePageState extends State<AccessFilePage> {
  final controller = TextEditingController();
  final fname = 'flutter_sample.txt';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }


  Future<File> getDataFile(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    return File(directory.path + "/" + filename);
  }

  void saveIt(String value) async {
    final file = await getDataFile(fname);
    file.writeAsString(value);
  }

  Future<String> loadIt() async {
    try {
      final file = await getDataFile(fname);
      return file.readAsString();
    } catch (e) {
      return '*** no data ***';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text('Access File'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              'File Access',
              style: TextStyle(
                fontSize: 32,
                fontWeight: ui.FontWeight.w500,
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            TextField(
              controller: controller,
              style: TextStyle(fontSize: 24),
              minLines: 1,
              maxLines: 5,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "save",
            icon: Icon(Icons.save, color: Colors.white, size: 32),
          ),
          BottomNavigationBarItem(
            label: "load",
            icon: Icon(Icons.open_in_new, color: Colors.white, size: 32),
          ),
        ],
        onTap: (int value) async {
          switch (value) {
            case 0:
              saveIt(controller.text);
              setState(() {
                controller.text = '';
              });
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('saved!'),
                  content: Text('save message to file.'),
                ),
              );
              break;
            case 1:
              String value = await loadIt();
              setState(() {
                controller.text = value;
              });
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('loaded!'),
                    content: Text('load message from file.'),
                ),
              );
              break;
            default:
              print('no default.');
          }
        },
      ),
    );
  }
}






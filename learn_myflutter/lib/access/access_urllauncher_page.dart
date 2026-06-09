import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AccessUrllauncherPage extends StatefulWidget {
  const AccessUrllauncherPage({super.key});

  State<AccessUrllauncherPage> createState() => AccessUrllauncherPageState();
}


class AccessUrllauncherPageState extends State<AccessUrllauncherPage> {
  late TextEditingController textController;
  late String searchStr;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    searchStr = "";
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Launcher'),
      ),
      body: Container(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(searchStr),
            TextField(
              controller: textController,
              onChanged: (String value) {
                setState(() {
                  searchStr = value;
                });
              },
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
            ElevatedButton(
                onPressed: () async {
                  final str = textController.text;
                  debugPrint("str: $str");
                  if (str.isNotEmpty) {
                    var uri = Uri.parse("https://www.google.co.jp/search?q=${str}");
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          // mode: LaunchMode.platformDefault
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      throw Exception("Could not launch $uri");
                    }
                  }
                },
                child: const Text('Search(ブラウザを開く)', style: TextStyle(fontSize: 20)),
            ),
          ],
        )
      )
    );
  }
}
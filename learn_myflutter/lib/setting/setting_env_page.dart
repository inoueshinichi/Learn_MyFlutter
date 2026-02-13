import 'package:flutter/material.dart';


class SettingEnvPage extends StatelessWidget {
  const SettingEnvPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    const endpoint = String.fromEnvironment('apiEndpoint');
    const logLevel = int.fromEnvironment('logLevel');
    const enableDebugMenu = bool.fromEnvironment('enableDebugMenu');

    return Scaffold(
        appBar: AppBar(
          title: const Text('L10n'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("endpoint: ${endpoint}", style: TextStyle(fontSize: 30)),
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                Text("logLevel: ${logLevel}", style: TextStyle(fontSize: 30)),
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                Text("enableDebugMenu: ${enableDebugMenu}", style: TextStyle(fontSize: 30)),
              ],
            )
        )
    );
  }
}
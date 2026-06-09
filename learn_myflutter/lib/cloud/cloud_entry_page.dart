import 'package:flutter/material.dart';
import 'package:learn_myflutter/cloud/firebase/cloud_firebase_entry_page.dart';


class CloudEntryPage extends StatelessWidget {
  const CloudEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Entry Page'),
      ),
      body: const CloudListMenuView(),
    );
  }
}


class CloudListMenuView extends StatelessWidget {
  const CloudListMenuView({super.key});

  void navGoogleFirebasePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const CloudFirebaseEntryPage()
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Center(
        child: ListView(
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              ListTile(
                // tileColor: Colors.blue,
                leading: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 44,
                    minWidth: 34,
                    maxHeight: 64,
                    maxWidth: 54,
                  ),
                  child: const FlutterLogo(),
                ),
                trailing: const Icon(Icons.more_vert),
                title: const Text('Google Firebase'),
                onTap: () => navGoogleFirebasePage(context),
              ),
              ]
        ),
    );
  }

}
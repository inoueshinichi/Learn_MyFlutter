import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_myflutter/firebase_options.dart';
import 'package:learn_myflutter/utils.dart';

class CloudFirebaseFirestorePage extends StatefulWidget {
  const CloudFirebaseFirestorePage({super.key});

  @override
  State<CloudFirebaseFirestorePage> createState() => CloudFirebaseFirestorePageState();
}


class CloudFirebaseFirestorePageState extends State<CloudFirebaseFirestorePage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final id = 'tiny_tank';
  final credential = 'info';
  final temporary = 'temporary';
  final message_key = "my_message";
  String temporaryMessage = "";

  Future<void> getFirestoreData(BuildContext context) async {
    try {

      final CollectionReference<Map<String, dynamic>> my_collection = firestore.collection(id);
      final DocumentReference<Map<String, dynamic>> my_document = my_collection.doc(credential);

      DocumentSnapshot<Map<String, dynamic>> result = await my_document.get();

      if (result.exists) {
        final Map<String, dynamic> data = result.data()!;
        debugPrint(data.toString());
        displayDialog(context, "Document", data.toString());
      } else {
        displayDialog(context, "Document", "Document not found");
      }

    } catch (error) {

      displayDialog(context, "Error", error.toString());
      debugPrint("Firestoreエラー: ${error.toString()}");
      return;
    }
  }

  Future<void> readTemporary(BuildContext context) async {
    try {

      final CollectionReference<Map<String, dynamic>> my_collection = firestore.collection(id);
      final DocumentReference<Map<String, dynamic>> my_document = my_collection.doc(temporary);

      DocumentSnapshot<Map<String, dynamic>> result = await my_document.get();

      if (result.exists) {
        final Map<String, dynamic> data = result.data()!;
        debugPrint(data.toString());

        // 画面更新
        setState(() {
          temporaryMessage = data[message_key];
        });

      } else {
        displayDialog(context, "Document", "Document not found");
      }

    } catch (error) {

      displayDialog(context, "Error", error.toString());
      debugPrint("Firestoreエラー: ${error.toString()}");
      return;
    }
  }

  Future<void> removeTemporary(BuildContext context) async {
    try {

      final CollectionReference<Map<String, dynamic>> my_collection = firestore.collection(id);
      final DocumentReference<Map<String, dynamic>> my_document = my_collection.doc(temporary);

      // データを取得
      DocumentSnapshot snapshot = await my_document.get();

      if (snapshot.exists) {
        my_document.delete();
        displayDialog(context, "Document", "Delete temporary data");
        setState(() {
          temporaryMessage = "";
        });
      } else {
        displayDialog(context, "Document", "No temporary data");
      }

    } catch (error) {

      displayDialog(context, "Error", error.toString());
      debugPrint("Firestoreエラー: ${error.toString()}");
      return;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firestore (開発モード 30間のみアクセス可)"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await getFirestoreData(context);
                },
                child: const Text(
                  'info 読み出し',
                  style: TextStyle(fontSize: 20),
                ),
            ),
            Padding(padding: EdgeInsets.all(20.0)),
            ElevatedButton(
              onPressed: () async {
                final String msg = "I'm TinyTank";
                firestore.collection(id)
                    .doc(temporary)
                    .set({
                      '$message_key': msg,
                    },
                  SetOptions(merge: true), // set()メソッドで既存データを消さない.
                );
                debugPrint("${msg} を追加しました。");
              },
              child: const Text(
                '追加と更新',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(padding: EdgeInsets.all(20.0)),
            ElevatedButton(
                onPressed: () async {
                  await readTemporary(context);
                },
                child: const Text(
                  'temporary 読み出し',
                  style: TextStyle(fontSize: 20),
                ),
            ),
            Padding(padding: EdgeInsets.all(20.0)),
            ElevatedButton(
              onPressed: () async {
                await removeTemporary(context);
              },
              child: const Text(
                'temporary 削除',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(padding: EdgeInsets.all(20.0)),
            Text(
              "$temporaryMessage",
              style: const TextStyle(color: Colors.indigoAccent),
            ),
          ],
        ),
      ),
    );
  }
}
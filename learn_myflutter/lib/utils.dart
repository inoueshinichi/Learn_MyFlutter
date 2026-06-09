import 'package:flutter/material.dart';


void displayDialog(BuildContext context, String title, String message) async {
  try {
    await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.pop<String>(context, 'OK'),
          ),
        ],
      ),
    );
  } catch(error) {
    debugPrint(error.toString());
  } finally {
    debugPrint("Finish showDialog $title");
  }
}
import 'package:flutter/material.dart';


class UIDialogPage extends StatefulWidget {
  const UIDialogPage({super.key});

  @override
  State<UIDialogPage> createState() => UIDialogPageState();
}


class UIDialogPageState extends State<UIDialogPage> {
  static var message = 'ok.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog UI'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: alertDialogButton,
                child: Text(
                  "Alert Dialog",
                  style: TextStyle(
                    fontSize: 32.0,
                    color: const Color.fromRGBO(23, 89, 87, 1.0),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: inputDialogButton,
                child: Text(
                  "Simple Dialog",
                  style: TextStyle(
                    fontSize: 32.0,
                    color: const Color.fromRGBO(23, 89, 87, 1.0),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void alertDialogButton() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("AlertDialog"),
        content: Text("This is sample."),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop<String>(context, 'Cancel'),
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.pop<String>(context, 'OK'),
          ),
        ],
      ),
    ).then<void>((value) => setState(() {
      message = 'selected $value';
    }));
  }

  void inputDialogButton() {
    showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: const Text('SimpleDialog'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () => Navigator.pop<String>(context, 'One'),
            child: const Text('One'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop<String>(context, 'Two'),
            child: const Text('Two'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop<String>(context, 'Three'),
            child: const Text('Three'),
          ),
        ],
      ),
    ).then<void>((value) => setState(() {
      message = 'selected $value';
    }));
  }

}
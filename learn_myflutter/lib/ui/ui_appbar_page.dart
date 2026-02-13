import 'package:flutter/material.dart';


class UIAppBarPage extends StatefulWidget {
  const UIAppBarPage({super.key});

  @override
  State<UIAppBarPage> createState() => UIAppBarPageState();
}


class UIAppBarPageState extends State<UIAppBarPage> {
  static var message = "ok";
  static var stars = "☆☆☆☆☆";
  static var star = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Custom AppBar'),
        leading: BackButton(
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.android),
            tooltip: 'add star...',
            onPressed: () {
              message = 'tap "android".';
              star++;
              update();
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            tooltip: 'substruct star...',
            onPressed: () {
              message = 'tap "favorite".';
              star--;
              update();
            },
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: Center(
              child: Text(
                stars,
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              )
            ),
        ),
      ),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 28.0,
          ),
        ),
      ),
    );
  }

  void update() {
    star = star < 0 ? 0 : star > 5 ? 5 : star;
    setState(() {
      stars = '★★★★★☆☆☆☆☆'.substring(5-star, 5-star+5);
      message = message + '[$star]';
    });
  }
}
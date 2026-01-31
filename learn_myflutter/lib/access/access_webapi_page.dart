import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AccessWebAPIPage extends StatefulWidget {
  const AccessWebAPIPage({super.key});

  @override
  State<AccessWebAPIPage> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return AccessWebAPIPageState();
  }
}


class AccessWebAPIPageState extends State<AccessWebAPIPage> {
  final controller1 = TextEditingController();
  static const host = 'baconipsum.com';
  static const path = '/api/?type=meat-and-filter&paras=1&format=text';

  final controller2 = TextEditingController();
  static const url_get = 'https://baconipsum.com/api/?type=meat-and-filter&paras=1&format=text';

  final controller3 = TextEditingController();
  static const url_post = 'https://jsonplaceholder.typicode.com/posts';

  void getWebAPIData1() async {
    var http = await HttpClient();
    HttpClientRequest request = await http.get(host, 80, path);
    HttpClientResponse response = await request.close();
    final value = await response.transform(utf8.decoder).join();
    controller1.text = value;
    print(value);
  }

  void getWebAPIData2() async {
    var https = await HttpClient();
    HttpClientRequest request = await https.getUrl(Uri.parse(url_get));
    HttpClientResponse response = await request.close();
    final value = await response.transform(utf8.decoder).join();
    controller2.text = value;
    print(value);
  }

  void postWebAPIData1() async {
    // Map<String, Object>
    final ob = <String, Object>{
      "title": "JsonPlaceHolder",
      "author": "TinyTank",
      "content": "This is post example."
    };
    final jsondata = json.encode(ob);
    var https = await HttpClient();
    HttpClientRequest request = await https.postUrl(Uri.parse(url_post));
    request.headers.set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    request.write(jsondata);
    HttpClientResponse response = await request.close();
    final value = await response.transform(utf8.decoder).join();
    controller3.text = value;
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text('Web API'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text(
                'Internet Access GET[1] http',
                style: TextStyle(fontSize: 32, fontWeight: ui.FontWeight.w500),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              TextField(
                controller: controller1,
                style: TextStyle(fontSize: 18.0),
                minLines: 1,
                maxLines: 5,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              ElevatedButton(
                onPressed: () {
                  getWebAPIData1();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('loaded!'),
                      content: Text("get[1] content from URI."),
                    ),
                  );
                },
                child: const Text('GET1'),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Text(
                'Internet Access GET[2] https',
                style: TextStyle(fontSize: 32, fontWeight: ui.FontWeight.w500),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              TextField(
                controller: controller2,
                style: TextStyle(fontSize: 18.0),
                minLines: 1,
                maxLines: 5,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              ElevatedButton(
                onPressed: () {
                  getWebAPIData2();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('loaded!'),
                      content: Text("get[2] content from URI."),
                    ),
                  );
                },
                child: const Text('GET2'),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Text(
                'Internet Access POST[1] https',
                style: TextStyle(fontSize: 32, fontWeight: ui.FontWeight.w500),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              TextField(
                controller: controller3,
                style: TextStyle(fontSize: 18.0),
                minLines: 1,
                maxLines: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  postWebAPIData1();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('loaded!'),
                      content: Text("post[1] content from URI."),
                    ),
                  );
                },
                child: const Text('POST1'),
              ),
            ],
          ),
        ),
      )
    );
  }
}


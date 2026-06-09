import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learn_myflutter/firebase_options.dart';
import 'package:learn_myflutter/utils.dart';


class CloudFirebaseAuthPage extends StatefulWidget {
  const CloudFirebaseAuthPage({super.key});

  @override
  State<CloudFirebaseAuthPage> createState() => CloudFirebaseAuthPageState();
}


class CloudFirebaseAuthPageState extends State<CloudFirebaseAuthPage> {
  // ログイン情報
  String email = "";
  String password = "";
  bool isLogin = false;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text("CouldFirebaseAuth"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              isLogin ? const Text("ログイン中") : const Text("ログアウト中"),
              Padding(padding: EdgeInsets.all(20.0)),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Email",
                ),
                onChanged: (String value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                ),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              ElevatedButton(
                child: const Text("Signup"),
                onPressed: () async {
                  try {
                    final User? user = (await FirebaseAuth.instance.
                    createUserWithEmailAndPassword(
                      email: email, password: password,
                    )).user;

                    if (user != null) {
                      displayDialog(context, "Success", "Success Signup");
                    }
                  } catch (error) {
                    displayDialog(context, "Error", error.toString());
                    debugPrint(error.toString());
                  }
                },
              ),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {
                  try {
                    final User? user = (await FirebaseAuth.instance.
                    signInWithEmailAndPassword(
                        email: email,
                        password: password)).user;

                    if (user != null) {
                      displayDialog(context, "Success", "Success Login");
                      setState(() {
                        isLogin = true;
                      });
                    }
                  } catch (error) {
                    displayDialog(context, "Error", error.toString());
                    debugPrint(error.toString());
                  }
                },
              ),
              ElevatedButton(
                  child: const Text('Logout'),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signOut();
                      displayDialog(context, "Success", "Success Logout");
                      setState(() {
                        isLogin = false;
                      });
                    } catch (error) {
                      displayDialog(context, "Error", error.toString());
                      debugPrint(error.toString());
                    }
                  }),
              ElevatedButton(
                  child: const Text('Password Reset'),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: email,
                      );
                      displayDialog(context, "Success",
                          "URL for reset password was sent to $email");
                    } catch (error) {
                      displayDialog(context, "Error", error.toString());
                      debugPrint(error.toString());
                    }
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
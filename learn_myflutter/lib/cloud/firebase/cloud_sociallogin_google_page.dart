import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learn_myflutter/firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learn_myflutter/utils.dart';

class CloudFirebaseSocialLoginGooglePage extends StatefulWidget {
  const CloudFirebaseSocialLoginGooglePage({Key? key}) : super(key: key);

  @override
  State<CloudFirebaseSocialLoginGooglePage> createState() => CloudFirebaseSocialLoginGooglePageState();
}


class CloudFirebaseSocialLoginGooglePageState extends State<CloudFirebaseSocialLoginGooglePage> {
  // Googleアカウント
  String displayName = "";
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleLogin = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);
  bool isLogin = false;

  Future<UserCredential?> signInWithGoogle(context) async {
    // Google認証
    try {
      // 1. ユーザーにアカウント選択を促す
      GoogleSignInAccount? signinAccount = await googleLogin.signIn();
      if (signinAccount == null) return null; // 途中でキャンセルされた場合

      // 2. 選択されたアカウントから認証詳細を取得
      GoogleSignInAuthentication auth = await signinAccount.authentication;

      // 3. Firebase用の認証情報（Credential）を作成
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      );

      // 4. Firebaseへの認証
      return await firebaseAuth.signInWithCredential(credential);

    } catch (error) {
      displayDialog(context, "Error", error.toString());
      debugPrint("Googleサインインエラー: ${error.toString()}");
      return null;
    }
  }

  Future<void> signOut() async {
    await googleLogin.signOut();
    await firebaseAuth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Login Google'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLogin ? const Text('ログイン中') : const Text('ログアウト中'),
              Padding(padding: EdgeInsets.all(20.0)),
              Text("Hello $displayName",
                  style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () async {
                  final userCredential = await signInWithGoogle(context);
                  if (userCredential != null) {
                    // 画面を更新
                    setState(() {
                      displayName = userCredential.user?.displayName ?? "";
                      isLogin = true;
                    });
                  }
                },
                child: const Text(
                  'Social Login',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              ElevatedButton(
                onPressed: () async {
                  await googleLogin.signOut();
                  await firebaseAuth.signOut();
                  setState(() {
                    isLogin = false;
                    displayName = "";
                  });
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
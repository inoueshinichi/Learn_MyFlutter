import 'package:flutter/material.dart';
import 'package:learn_myflutter/cloud/firebase/cloud_authentication_page.dart';
import 'package:learn_myflutter/cloud/firebase/cloud_firestore_page.dart';
import 'package:learn_myflutter/cloud/firebase/cloud_sociallogin_google_page.dart';
import 'package:learn_myflutter/cloud/firebase/cloud_storage_page.dart';
import 'package:learn_myflutter/cloud/firebase/cloud_ml_img_ocr_page.dart';
import 'package:learn_myflutter/cloud/firebase/cloud_ml_img_labeling_page.dart';
import 'package:learn_myflutter/cloud/firebase/cloud_messaging_page.dart';
import 'package:learn_myflutter/cloud/firebase/cloud_in_app_messasing_page.dart';
import 'package:learn_myflutter/cloud/firebase/cloud_crashlytics_page.dart';

class CloudFirebaseEntryPage extends StatelessWidget {
  const CloudFirebaseEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase services'),
      ),
      body: CloudFirebaseGridMenuView(),
    );
  }
}


class CloudFirebaseGridMenuView extends StatelessWidget {
  const CloudFirebaseGridMenuView({super.key});

  void navAuthenticationPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CloudFirebaseAuthPage(),
      ),
    );
  }

  void navSocialLoginGooglePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CloudFirebaseSocialLoginGooglePage(),
      ),
    );
  }

  void navFirestorePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const CloudFirebaseFirestorePage(),
      ),
    );
  }

  void navStoragePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const CloudFirebaseStoragePage(),
      ),
    );
  }

  void navMLImgOCRPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const CloudFirebaseMLImgOCRPage(),
      ),
    );
  }

  void navMLImgLabelingPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const CloudFirebaseMLImgLabelingPage(),
      ),
    );
  }

  void navMessagingPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const CloudFirebaseMessagingPage(),
      ),
    );
  }

  void navInAppMessagingPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const CloudFirebaseInAppMessagingPage(),
      ),
    );
  }

  void navCrashlyticsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const CloudFirebaseCrashlyticsPage(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      shrinkWrap: true,
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: [
        ElevatedButton(
          onPressed:  () => navAuthenticationPage(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // 背景色
            foregroundColor: Colors.white, // 文字やアイコンの色
            shadowColor: Colors.black,    // 影の色
            elevation: 5,                 // 影の高さ
          ),
          child: const Text('A'),
        ),
        ElevatedButton(
          onPressed:  () => navSocialLoginGooglePage(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // 背景色
            foregroundColor: Colors.white, // 文字やアイコンの色
            shadowColor: Colors.black,    // 影の色
            elevation: 5,                 // 影の高さ
          ),
          child: const Text('B'),
        ),
        ElevatedButton(
          onPressed:  () => navFirestorePage(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // 背景色
            foregroundColor: Colors.white, // 文字やアイコンの色
            shadowColor: Colors.black,    // 影の色
            elevation: 5,                 // 影の高さ
          ),
          child: const Text('C'),
        ),
        ElevatedButton(
          onPressed:  () => navStoragePage(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // 背景色
            foregroundColor: Colors.white, // 文字やアイコンの色
            shadowColor: Colors.black,    // 影の色
            elevation: 5,                 // 影の高さ
          ),
          child: const Text('D'),
        ),
        ElevatedButton(
          onPressed:  () => navMLImgOCRPage(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // 背景色
            foregroundColor: Colors.white, // 文字やアイコンの色
            shadowColor: Colors.black,    // 影の色
            elevation: 5,                 // 影の高さ
          ),
          child: const Text('E'),
        ),
        ElevatedButton(
          onPressed:  () => navMLImgLabelingPage(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // 背景色
            foregroundColor: Colors.white, // 文字やアイコンの色
            shadowColor: Colors.black,    // 影の色
            elevation: 5,                 // 影の高さ
          ),
          child: const Text('F'),
        ),
        ElevatedButton(
          onPressed:  () => navMessagingPage(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigoAccent,
            foregroundColor: Colors.white,
            shadowColor: Colors.black,
            elevation: 5,
          ),
          child: const Text('G'),
        ),
        ElevatedButton(
          onPressed:  () => navInAppMessagingPage(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            shadowColor: Colors.black,
            elevation: 5,
          ),
          child: const Text('H'),
        ),
        ElevatedButton(
          onPressed:  () => navCrashlyticsPage(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlueAccent,
            foregroundColor: Colors.white,
            shadowColor: Colors.black,
            elevation: 5,
          ),
          child: const Text('I'),
        ),
        ElevatedButton(
          onPressed:  () => {},
          child: const Text('J'),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('K'),
        ),
        ElevatedButton(
          onPressed:  () => {},
          child: const Text('L'),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('M'),
        ),
        ElevatedButton(
          onPressed:  () => {},
          child: const Text('N'),
        ),ElevatedButton(
          onPressed: () => {},
          child: const Text('O'),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('P'),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('Q'),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('R'),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('S'),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('T'),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('U'),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('V'),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('W'),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('X'),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('Y'),
        ),
        ElevatedButton(
          onPressed: () => {},
          child: const Text('Z'),
        ),
      ],
    );
  }
}
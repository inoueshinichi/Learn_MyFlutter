import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:learn_myflutter/firebase_options.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart' as picker;
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';


class CloudFirebaseMLImgOCRPage extends ConsumerStatefulWidget {
  const CloudFirebaseMLImgOCRPage({super.key});

  @override
  ConsumerState<CloudFirebaseMLImgOCRPage> createState() => _CloudFirebaseMLImgOCRPageState();
}


////////////////////////////
// AsyncNotifier/Provider //
////////////////////////////
// AsyncNotifier
class FirebaseMLImgOCRAsyncNotifier extends AsyncNotifier<String?> {
  late TextRecognizer _textRecognizer;

  @override
  Future<String?> build() async {
    // 1. インスタンスの生成（日本語設定）
    _textRecognizer = TextRecognizer(script: TextRecognitionScript.japanese);

    // 2. プロバイダーが使われなくなった時の解放処理を登録
    ref.onDispose(() {
      _textRecognizer.close();
      debugPrint("TextRecognizer を解放しました");
    });

    return null;
  }

  Future<String?> getCurrentText() async {
    return state.valueOrNull;
  }

  Future<void> recognizeText(picker.XFile pickerFile) async {
    state = const AsyncLoading();

    final InputImage imageFile = InputImage.fromFilePath(pickerFile.path);

    // state = AsyncValue.guard(() async { ... }) を使うと
    // try-catchを省略してエラーハンドリングができる.
    state = await AsyncValue.guard(() async {
      final RecognizedText recognizedText =
        await _textRecognizer.processImage(imageFile);

      String text = recognizedText.text;

      for (TextBlock block in recognizedText.blocks) {
        // ブロック単位で取得したい情報がある場合は、ここに記載
        debugPrint("block.text: ${block.text}");
        for (TextLine line in block.lines) {
          // 行単位で取得したい情報がある場合は、ここに記載
          debugPrint("line.text: ${line.text}");
        }
      }

      return text;
    });
  }
}

// AsyncNotifierProvider
final firebaseMLImgOCRAsyncNotifierProvider = AsyncNotifierProvider<
    FirebaseMLImgOCRAsyncNotifier, String?>(() {
  return FirebaseMLImgOCRAsyncNotifier();
});


class _CloudFirebaseMLImgOCRPageState extends ConsumerState<CloudFirebaseMLImgOCRPage> {
  final picker.ImagePicker _picker = picker.ImagePicker();
  picker.XFile? imgFile;

  @override
  void initState() {
    // TODO: implement initState
    // ref.read(firebaseMLImgOCRAsyncNotifierProvider.notifier).build(); // 初期化
    Future.microtask(() => ref.invalidate(firebaseMLImgOCRAsyncNotifierProvider));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> _recognizeCameraImage() async {
    final picker.XFile? pickedFile = await _picker.pickImage(
        source: picker.ImageSource.camera
    );

    debugPrint("pickerFile: ${pickedFile.toString()}");

    if (pickedFile == null) return;

    // 撮影した画像を先に描画
    setState(() {
      imgFile = pickedFile;
    });

    // 文字認識
    ref.read(firebaseMLImgOCRAsyncNotifierProvider.notifier)
        .recognizeText(pickedFile);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final AsyncValue<String?> recognizedText = ref.watch(
        firebaseMLImgOCRAsyncNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("CloudFirebaseMLImgOCR"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "認識対象の画像",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                width: 250,
                height: 250,
                child: imgFile == null
                    ? Text('写真を選択してください')
                    : Image.file(File(imgFile!.path)),
              ),
              Padding(padding: EdgeInsets.all(10)),
              const Text(
                "認識した文字列",
                style: TextStyle(fontSize: 20),
              ),
              Padding(padding: EdgeInsets.all(10)),
              recognizedText.when(
                error: (e, st) => Text(e.toString()),
                loading: () => const CircularProgressIndicator(),
                data: (value) => (value == null) ? const Text("初期値") : SingleChildScrollView(
                  child: Text(value),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _recognizeCameraImage,
        tooltip: 'Camera',
        heroTag: null,
        child: const Icon(Icons.camera),
      ),
    );
  }


}



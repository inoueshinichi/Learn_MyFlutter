import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:image/image.dart';
import 'package:learn_myflutter/firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:learn_myflutter/utils.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image/image.dart' as img_lib; // 画像データそのもの
import 'package:flutter/src/widgets/image.dart' as widget_img;

import 'package:image_picker/image_picker.dart' as picker;
import 'package:path_provider/path_provider.dart';


// Provider
// StateProvider
// NotifierProvider
// FutureProvider
// StreamProvider

// FutureProvider from API
final downloadImageProvider = FutureProvider<widget_img.Image?>((ref) async {
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference imageRef = storage.ref().child('Download').child('Nekosan_Face.bmp');
  String imageUrl = await imageRef.getDownloadURL();

  debugPrint(imageUrl.toString());

  // 画像ファイルはローカルにも保存
  Directory appDocDir = await getApplicationDocumentsDirectory();
  File downloadToFile = File("${appDocDir.path}/download-logo.png");
  await imageRef.writeToFile(downloadToFile);

  return widget_img.Image.network(imageUrl);
});


// AsyncNotifier from API
class UploadAsyncNotifier extends AsyncNotifier<widget_img.Image?> {

  @override
  Future<widget_img.Image?> build() async {
    return null;
  }

  Future<widget_img.Image?> uploadImage() async {

    final pickerFile = await picker.ImagePicker().pickImage(
        source: picker.ImageSource.gallery);
    if (pickerFile == null) {
      return null;
    }

    File file = File(pickerFile.path);

    FirebaseStorage storage = FirebaseStorage.instance;

    try {
      state = const AsyncLoading();

      // バイトデータを読み込む
      // final bytes = await file.readAsBytes();

      // --- 重要: imageライブラリのImageオブジェクトに変換 ---
      // fromBytesではなく decodeImage を使います
      // final decodedImage = img_lib.decodeImage(bytes);

      // Save to mobile
      Directory appDocDir = await getApplicationDocumentsDirectory();
      // パス構築は ${appDocDir.path} とするのが一般的です
      final savePath = "${appDocDir.path}/upload-pic.png";
      await file.copy(savePath); // 直接コピーする方が効率的です

      // upload to firebase storage
      await storage.ref("Upload/upload-pic.png").putFile(file);

      // 3. 状態を更新（UI側に通知が行く）
      state = AsyncValue.data(widget_img.Image.file(file));

      return widget_img.Image.file(file);

    } catch (error, stackTrace) {
      debugPrint(error.toString());

      // エラー状態を反映
      state = AsyncError(error, stackTrace);
    }
  }
}

// AsyncNotifierProvider
final uploadImageProvider = AsyncNotifierProvider<UploadAsyncNotifier, widget_img.Image?>(() {
  return UploadAsyncNotifier();
});



class CloudFirebaseStoragePage extends ConsumerStatefulWidget {
  const CloudFirebaseStoragePage({super.key});

  @override
  ConsumerState<CloudFirebaseStoragePage> createState() => CloudFirebaseStoragePageState();
}


class CloudFirebaseStoragePageState extends ConsumerState<CloudFirebaseStoragePage> {
  widget_img.Image? localImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    localImage = null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    final storageImgAsync = ref.watch(downloadImageProvider);
    final imageAsync = ref.watch(uploadImageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Storage (開発モード 30間のみアクセス可)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Auto Downloaded Image'),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            storageImgAsync.when(
              data: (decodedImage) {
                if (decodedImage == null) return Icon(Icons.arrow_back);
                return decodedImage;
              },
              error: (error, stackTrace) => Text('Error: $error'),
              loading: () => const CircularProgressIndicator(),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            const Text('Upload Image'),
            Container(
              width: 200,
              height: 200,
              child: imageAsync.when(
                data: (widgetImage) => (widgetImage != null) ? widgetImage : Icon(Icons.arrow_back_ios),
                loading: () => CircularProgressIndicator(),
                error: (err, stack) => Text("エラー: $err"),
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            const Text('Local Image'),
            Container(
              width: 200,
              height: 200,
              child: (localImage != null) ? localImage : Icon(Icons.arrow_back_outlined),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
              onPressed: () async {
                Directory appDocDir = await getApplicationDocumentsDirectory();
                // パス構築は ${appDocDir.path} とするのが一般的です
                final savePath = "${appDocDir.path}/upload-pic.png";
                final file = File(savePath);
                setState(() {
                  localImage = widget_img.Image.file(file);
                });
              },
              child: const Icon(Icons.download_outlined),
          ),
          FloatingActionButton(
            onPressed: () => ref.read(uploadImageProvider.notifier).uploadImage(),
            // onPressed: () => {},
            child: const Icon(Icons.upload_file_outlined),
          ),
        ],
      ),
    );
  }
}
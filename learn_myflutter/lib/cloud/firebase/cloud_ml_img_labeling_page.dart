import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart' as picker;

// Firebase
import 'package:learn_myflutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';


class CloudFirebaseMLImgLabelingPage extends ConsumerStatefulWidget {
  const CloudFirebaseMLImgLabelingPage({super.key});

  @override
  ConsumerState<CloudFirebaseMLImgLabelingPage> createState() => _CloudFirebaseMLImgLabelingPageState();
}

////////////////////////////
// AsyncNotifier/Provider //
////////////////////////////
// AsyncNotifier
class FirebaseMLImgLabelingAsyncNotifier extends AsyncNotifier<List<({String label, double confidence})>> {
  late ImageLabeler _imageLabeler;
  final ImageLabelerOptions _options = ImageLabelerOptions(
      confidenceThreshold: 0.7);

  @override
  Future<List<({String label, double confidence})>> build() async {
    // 1. インスタンスの生成
    _imageLabeler = ImageLabeler(options: _options);

    ref.onDispose(() {
      _imageLabeler.close();
      debugPrint("ImageLabeler を解放しました");
    });

    return [];
  }


  Future<void> labelImage(picker.XFile pickerFile) async {
    state = const AsyncLoading();
    final InputImage imageFile = InputImage.fromFilePath(pickerFile.path);

    state = await AsyncValue.guard(() async {
      List<({String label, double confidence})> result = [];
      final List<ImageLabel> labels = await _imageLabeler.processImage(imageFile);
      debugPrint("async-notifier-labels: ${labels.toString()}");
      for (ImageLabel ret in labels) {
        debugPrint("label: ${ret.label}, confidence: ${ret.confidence.toString()}");
        result.add((label: ret.label, confidence: ret.confidence));
      }
      return result;
    });
  }
}

// AsyncNotifierProvider
final firebaseMLImgLabelingAsyncNotifierProvider =
AsyncNotifierProvider<FirebaseMLImgLabelingAsyncNotifier, List<({String label, double confidence})>>(() {
  return FirebaseMLImgLabelingAsyncNotifier();
});



class _CloudFirebaseMLImgLabelingPageState extends ConsumerState<CloudFirebaseMLImgLabelingPage> {
  final picker.ImagePicker _picker = picker.ImagePicker();
  picker.XFile? _imgFile;

  @override
  void initState() {
    super.initState();

    // Widgetの構築が終わった直後にリセットを実行
    Future.microtask(() => ref.invalidate(firebaseMLImgLabelingAsyncNotifierProvider));
    // ref.read(firebaseMLImgLabelingAsyncNotifierProvider.notifier).build();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    debugPrint('画面を破棄しました。');
    super.dispose();
  }

  Future<void> _pickImageFromCamera() async {
    final picker.XFile? pickedFile = await _picker.pickImage(
      source: picker.ImageSource.camera
    );
    if (pickedFile == null) return;

    // UI更新
    setState(() {
      _imgFile = pickedFile;
    });
  }


  Future<void> _labelingImage() async {
    // 画像認識
    if (_imgFile == null) return;
    final provider = ref.read(firebaseMLImgLabelingAsyncNotifierProvider.notifier);
    await provider.labelImage(_imgFile!);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    final AsyncValue<List<({String label, double confidence})>> labels = ref.watch(
      firebaseMLImgLabelingAsyncNotifierProvider
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("CloudFirebaseMLImgLabeling"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '認識対象の画像',
              style: TextStyle(fontSize: 20),
            ),
            Container(
                width: 250,
                height: 250,
                child: _imgFile == null
                    ? Text('写真を選択してください')
                    : Image.file(File(_imgFile!.path))
            ),
            Padding(padding: EdgeInsets.all(10)),
            const Text(
              '認識したラベル',
              style: TextStyle(fontSize: 20),
            ),
            Padding(padding: EdgeInsets.all(10)),
            labels.when(
              skipLoadingOnReload: false,
              error: (e, st) => Text(e.toString()),
              loading: () => const CircularProgressIndicator(),
              // loading: () {
              //   debugPrint('loading...');
              //   return const Text('認識中...');
              // },
              data: (value) {
                if (value.isEmpty) {
                  return DecoratedBox(
                      decoration: BoxDecoration(color: Colors.blueGrey),
                      child: const Text(
                          '認識結果はありません',
                          style: TextStyle(color: Colors.white),
                      ),
                  );
                }

                return ListView.builder(
                  itemCount: value.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(value[index].label),
                      subtitle: Text(value[index].confidence.toString()),
                    );
                  }
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: _pickImageFromCamera,
            tooltip: 'Camera',
            heroTag: null,
            child: const Icon(Icons.camera),
          ),
          FloatingActionButton(
            onPressed: _labelingImage,
            tooltip: 'Labeling',
            heroTag: null,
            child: const Icon(Icons.label),
          ),
          FloatingActionButton(
            onPressed: () => ref.invalidate(firebaseMLImgLabelingAsyncNotifierProvider),
            tooltip: 'Clear',
            heroTag: null,
            child: const Icon(Icons.clear),
          ),
        ],
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as image_lib;

import 'gen/assets.gen.dart';


class EditImgStartPage extends StatelessWidget {
  const EditImgStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Edit Image", style: TextStyle(fontSize: 30.0)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "今日は${DateTime.now()}です.",
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            ElevatedButton(
                onPressed: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EditImgSelectPage(),
                    ),
                  )
                },
                child: const Text('開始'),
            ),
          ],
        ),
      ),
    );
  }
}


class EditImgSelectPage extends StatefulWidget {
  const EditImgSelectPage({super.key});

  @override
  State<EditImgSelectPage> createState() => EditImgSelectPageState();
}


class EditImgSelectPageState extends State<EditImgSelectPage> {
  final ImagePicker imgPicker = ImagePicker();
  Uint8List? imgBitmap;


  Future<void> selectImage() async {

    // XFile: ファイルの抽象化クラス
    // 画像を選択する
    final XFile? imgFile = await imgPicker.pickImage(
      source: ImageSource.camera,
      // source: ImageSource.gallery,
    );

    // ファイルオブジェクトから画像データを取得する
    final imageBitmap = await imgFile?.readAsBytes();
    assert(imageBitmap != null);
    if (imageBitmap == null) return;

    final img = image_lib.decodeImage(imageBitmap);
    assert(img != null);
    if (img == null) return;

    // Image
    final image_lib.Image resizedImg;
    if (img.width > img.height) {
      // 横長画像→横幅500px
      resizedImg = image_lib.copyResize(img, width: 500);
    } else {
      // 縦長画像→縦幅500px
      resizedImg = image_lib.copyResize(img, height: 500);
    }

    setState(() {
      imgBitmap = image_lib.encodeBmp(resizedImg);
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    final imageBitmap = imgBitmap;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('画像選択'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageBitmap != null) Image.memory(imageBitmap),
            ElevatedButton(
                onPressed: selectImage,
                child: const Text('画像を選ぶ'),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            if (imgBitmap != null)
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          EditImgModifyPage(
                              imgBitmap: imgBitmap!
                          ),
                    ),
                  );
                },
                child: const Text('画像を編集する'),
              ),
          ],
        )
      ),
    );
  }
}


class EditImgModifyPage extends StatefulWidget {
  const EditImgModifyPage({super.key, required this.imgBitmap});

  final Uint8List imgBitmap;

  @override
  State<EditImgModifyPage> createState() => EditImgModifyPageState();
}


class EditImgModifyPageState extends State<EditImgModifyPage> {

  late Uint8List _imgBitmap;

  @override
  void initState() {
    super.initState();
    _imgBitmap = widget.imgBitmap;
  }


  void rotateImg() {
    final img = image_lib.decodeImage(_imgBitmap);
    if (img == null) return;
    final rotImg = image_lib.copyRotate(img, angle: 45);
    setState(() {
      _imgBitmap = image_lib.encodeBmp(rotImg);
    });
  }


  void flipImg() {
    final img = image_lib.decodeImage(_imgBitmap);
    if (img == null) return;
    final flipImg = image_lib.copyFlip(img,
        direction: image_lib.FlipDirection.horizontal,
    );
    setState(() {
      _imgBitmap = image_lib.encodeBmp(flipImg);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('画像編集画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.memory(_imgBitmap),
            Padding(padding: EdgeInsets.all(20)),
            IconButton(
              onPressed: rotateImg,
              icon: const Icon(Icons.rotate_left),
              // icon: Assets.images.iconmonstrRefreshLined.svg(
              //   width: 24,
              //   height: 24,
              // )
            ),
            IconButton(
              onPressed: flipImg,
              icon: const Icon(Icons.flip),
              // icon: Assets.images.iconmonstrLayoutVerticalLined.svg(
              //   width: 24,
              //   height: 24,
              // )
            ),
          ],
        ),
      ),
    );
  }
}

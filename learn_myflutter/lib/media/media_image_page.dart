import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MediaImagePage extends StatefulWidget {
  const MediaImagePage({super.key});

  @override
  State<MediaImagePage> createState() => MediaImagePageState();
}


class MediaImagePageState extends State<MediaImagePage> {
  Uint8List? bytes;
  bool isLandscape = false;

  @override
  void initState() {
    super.initState();

    // 非同期でアセット画像を取得
    rootBundle.load('assets/images/nekosan.png')
      .then((data) {
      if (mounted) {
        setState(() {
          bytes = data.buffer.asUint8List(); // UInt8List
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery : 端末の情報を返す
    var mediaQuery = MediaQuery.of(context);
    if (mediaQuery.orientation == Orientation.landscape) {
      // landspace(横)
      isLandscape = true;
    } else {
      // 縦
      isLandscape = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('アイコン'),
            const Icon(
              Icons.wb_incandescent_rounded,
              color: Colors.pink,
              size: 30,
            ),

            const Text('アセット画像: Androidの9-Patchと同じ'),
            Image.asset(
              "assets/images/nekosan.png",
              gaplessPlayback: true,
              centerSlice: Rect.fromCenter(
                center: Offset(50, 50),
                width: 2.0,
                height: 2.0,
              ),
            ),

            const Text('アセット画像: FrameBuilder'),
            Image.asset(
                "assets/images/nekosan.png",
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  // 画像がすぐに描画可能か否か?
                  if (wasSynchronouslyLoaded) {
                    return child;
                  }
                  return AnimatedOpacity(
                    child: child,
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut,
                  );
                }
            ),

            const Text('ネットワーク画像'),
            Image.network(
                "https://ssb88.tiny-tank.jp/static/base/image/SSB88_LOGO.png",
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                }
            ),

            const Text('端末内画像(工事中)'),
            // Image.file("device/your/path/to/image.png"),

            const Text('バイナリデータからの画像'),
            bytes == null ? Container() :
            Image.memory(
                bytes!,
                // fitプロパティ
                fit: BoxFit.contain
              // BoxFit.fill
              // BoxFit.fitHeight
              // BoxFit.fitWidth
              // BoxFit.cover
            ),
            const Spacer(),

          ],
        ),
      )
    );
  }
}
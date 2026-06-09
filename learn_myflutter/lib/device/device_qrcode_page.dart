import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';


class DeviceQrcodePage extends StatelessWidget {
  const DeviceQrcodePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            ),
            SizedBox(
              child:  Container(
                child:  Text(
                  'Show QR or Scan QR',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blueGrey,
                alignment: Alignment.center,
              ),
              width: double.infinity,
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            ElevatedButton(
                onPressed: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const QRCodeShowPage();
                        },
                    ),
                  ),
                },
                child: const Text("Show QR code"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
            ElevatedButton(
                onPressed: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const QRCodeScanPage();
                      },
                    ),
                  ),
                },
                child: const Text("Scan QR code"),
            ),
          ],
        ),
      )
    );
  }
}


class QRCodeShowPage extends StatefulWidget {
  const QRCodeShowPage({super.key});

  @override
  State<QRCodeShowPage> createState() => QRCodeShowPageState();
}


class QRCodeShowPageState extends State<QRCodeShowPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant QRCodeShowPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show QR code'),
      ),
      body: Center(
        child: QrImageView(
          data: 'https://www.google.com', // QRコードにする文字列
          version: QrVersions.auto,
          size: 200,
          gapless: false,
          embeddedImage: AssetImage('assets/images/nekosan.png'),
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: Size(40, 40),
          ),
        ),
      ),
    );
  }
}


class QRCodeScanPage extends StatefulWidget {
  const QRCodeScanPage({super.key});

  @override
  State<QRCodeScanPage> createState() => QRCodeScanPageState();
}


class QRCodeScanPageState extends State<QRCodeScanPage> {
  late MobileScannerController scanQRController;
  bool isScanCompleted = false;

  @override
  void initState() {
    super.initState();
    scanQRController = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
    );
  }

  @override
  void dispose() {
    scanQRController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant QRCodeScanPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR code'),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: scanQRController,
            onDetect: (capture) {
              if (isScanCompleted) return;

              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                debugPrint('見つかったコード: ${barcode.rawValue}');
              }

              if (barcodes.isNotEmpty) {
                setState(() {
                  isScanCompleted = true;
                });
              }

              // カメラ停止
              scanQRController.stop();

              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => QRCodeUrlListPage(barcodes: barcodes)
                ),
              ).then((_) {
                setState(() {
                  isScanCompleted = false;
                });
                scanQRController.start();
              });

            },
          ),
        ],
      )
    );
  }
}


class QRCodeUrlListPage extends StatelessWidget {

  final List<Barcode> barcodes;

  const QRCodeUrlListPage({
    super.key,
    required this.barcodes
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Result'),
      ),
      body: ListView.builder(
        itemCount: barcodes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(this.barcodes[index].rawValue!),
            leading: Icon(Icons.link),
            textColor: Colors.blue,
            onTap:  () async {
              final uri = Uri.parse(this.barcodes[index].rawValue!);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri,
                  // mode: LaunchMode.platformDefault
                  mode: LaunchMode.externalApplication,
                );
              } else {
                throw Exception("Could not launch $uri");
              }
            }
          );
        }
      )
    );
  }
}


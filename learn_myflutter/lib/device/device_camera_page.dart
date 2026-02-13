import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as image_lib;


class DeviceCameraPage extends StatefulWidget {
  const DeviceCameraPage({super.key});

  @override
  State<DeviceCameraPage> createState() => DeviceCameraPageState();
}


class DeviceCameraPageState extends State<DeviceCameraPage> {
  XFile? imgFile;
  final imagePicker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera
    );
    setState(() {
      if (pickedFile != null) {
        imgFile = XFile(pickedFile.path);
      }
    });
  }

  Future<void> getImageFromGallery() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery
    );
    setState(() {
      if (pickedFile != null) {
        imgFile = XFile(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera/Gallery"),
      ),
      body: Center(
        child: imgFile == null
            ? Text('写真を選択してください', style: Theme.of(context).textTheme.headlineMedium)
            : Image.file(File(imgFile!.path)),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: getImageFromCamera,
            child: const Icon(Icons.photo_camera),
          ),
          FloatingActionButton(
            onPressed: getImageFromGallery,
            child: const Icon(Icons.photo_album),
          ),
        ],
      ),
    );
  }
}
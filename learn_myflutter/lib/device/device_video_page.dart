import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class DeviceVideoPage extends StatefulWidget {
  const DeviceVideoPage({super.key});

  @override
  State<DeviceVideoPage> createState() => DeviceVideoPageState();
}


class DeviceVideoPageState extends State<DeviceVideoPage> {
  VideoPlayerController? videoController;
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

  Future<void> getVideoFromCamera() async {
    XFile? pickedFile = await imagePicker.pickVideo(
      source: ImageSource.camera
    );
    if (pickedFile != null) {
      videoController = VideoPlayerController.file(File(pickedFile.path));
      videoController!.initialize().then((_) {
        setState(() {
          videoController!.play();
        });
      });
    }
  }

  Future<void> getVideoFromGalley() async {
    XFile? pickedFile = await imagePicker.pickVideo(
      source: ImageSource.gallery
    );
    if (pickedFile != null) {
      videoController = VideoPlayerController.file(File(pickedFile.path));
      videoController!.initialize().then((_) {
        setState(() {
          videoController!.play();
        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
      ),
      body: Center(
        child: videoController == null
          ? Text('動画を選択してください', style: Theme.of(context).textTheme.headlineMedium)
          : VideoPlayer(videoController!),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: getVideoFromCamera,
            child: const Icon(Icons.video_call),
            heroTag: null,
          ),
          FloatingActionButton(
            onPressed: getVideoFromGalley,
            child: const Icon(Icons.movie_creation),
            heroTag: null,
          ),
        ],
      ),
    );
  }

}
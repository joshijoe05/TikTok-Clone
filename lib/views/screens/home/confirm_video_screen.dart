import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controllers/upload_video_controller.dart';
import 'package:tiktok_clone/views/widgets/text_field.dart';
import 'package:video_player/video_player.dart';

class ConfirmVideoScreen extends StatefulWidget {
  final File videoFile;
  final String videoUrl;

  const ConfirmVideoScreen(
      {super.key, required this.videoFile, required this.videoUrl});

  @override
  State<ConfirmVideoScreen> createState() => _ConfirmVideoScreenState();
}

class _ConfirmVideoScreenState extends State<ConfirmVideoScreen> {
  late VideoPlayerController controller;
  final TextEditingController _songController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();

  final UploadVideoController _uploadVideoController =
      Get.put(UploadVideoController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });

    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 1.5,
              width: MediaQuery.sizeOf(context).width,
              child: VideoPlayer(controller),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.sizeOf(context).width - 20,
                    child: TextInputField(
                        controller: _songController,
                        icon: Icons.music_note,
                        labelText: 'Song Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.sizeOf(context).width - 20,
                    child: TextInputField(
                        controller: _captionController,
                        icon: Icons.closed_caption,
                        labelText: 'Caption'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () => _uploadVideoController.uploadVideo(
                      _songController.text,
                      _captionController.text,
                      widget.videoUrl,
                    ),
                    child: const Text(
                      'Share !',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

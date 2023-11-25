import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/screens/home/confirm_video_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

  pickVideo(ImageSource src) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.to(ConfirmVideoScreen(
        videoFile: File(video.path),
        videoUrl: video.path,
      ));
    } else {
      Get.snackbar('Video not selected', 'Please select a video');
    }
  }

  _showOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.gallery),
            child: Row(
              children: [
                Icon(Icons.image),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    'Gallery',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.camera),
            child: Row(
              children: [
                Icon(Icons.camera_alt),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    'Camera',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Get.back(),
            child: Row(
              children: [
                Icon(Icons.cancel),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => _showOptionsDialog(context),
          child: Container(
            width: 190,
            height: 50,
            color: buttonColor,
            child: Center(
              child: Text(
                'Add Video',
                style: TextStyle(
                  fontSize: 20,
                  color: backgroundColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

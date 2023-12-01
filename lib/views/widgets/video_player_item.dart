import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controllers/video_controller.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String id;
  const VideoPlayerItem({super.key, required this.videoUrl, required this.id});

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController videoplayerController;
  VideoController videoController = Get.put(VideoController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoplayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoplayerController.play();
        videoplayerController.setVolume(1);
        videoplayerController.setLooping(true);
      });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: backgroundColor,
      ),
      child: GestureDetector(
        onLongPress: () => videoplayerController.pause(),
        onLongPressUp: () => videoplayerController.play(),
        onDoubleTap: () => videoController.likeVideo(widget.id),
        child: VideoPlayer(videoplayerController),
      ),
    );
  }
}

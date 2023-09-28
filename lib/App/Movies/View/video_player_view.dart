import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../Utils/Theme/colors.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerViewState();
  }
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  YoutubePlayerController? _controller;
  String? title;
  String? url;
  @override
  void initState() {
    super.initState();
    title = Get.arguments[0];
    url = Get.arguments[1];

    _controller = YoutubePlayerController(
      initialVideoId: url!.split('/').toList().last,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    print(url);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text(title ?? "Movie Trailer"),
      ),
      body: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppColor.primaryColor,
        progressColors: const ProgressBarColors(
          playedColor: AppColor.primaryColor,
          handleColor: AppColor.primaryColor,
        ),
        onReady: () {
          _controller!.addListener(() {});
        },
      ),
    );
  }
}

class MyColors {}

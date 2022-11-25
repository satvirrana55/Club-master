import 'package:flutter/material.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class videoCard extends StatefulWidget {
  final VideoPlayerController? videoPlayerController;
  final bool? looping;
  final bool? autoplay;

  videoCard({
    this.videoPlayerController,
    this.looping,
    this.autoplay,
    Key? key,
  }) : super(key: key);

  @override
  _videoCardState createState() => _videoCardState();
}

class _videoCardState extends State<videoCard> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController:
          widget.videoPlayerController as VideoPlayerController,
      aspectRatio: 1,
      autoInitialize: false,
      autoPlay: widget.autoplay as bool,
      looping: widget.looping as bool,
      showOptions: false,
      showControls: false,
      showControlsOnInitialize: false,
      cupertinoProgressColors: ChewieProgressColors(
          backgroundColor: Colors.green,
          bufferedColor: Colors.green,
          playedColor: Colors.green,
          handleColor: Colors.green),
      materialProgressColors: ChewieProgressColors(
          backgroundColor: AppColors.outline,
          bufferedColor: AppColors.outline,
          playedColor: AppColors.greenColor,
          handleColor: AppColors.greenColor),
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.yellow),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Theme(
          data: Theme.of(context).copyWith(
              dialogBackgroundColor: Colors.green, textTheme: TextTheme()),
          child: Chewie(
            controller: _chewieController,
          ),
        ),
      ),
    );
  }
}

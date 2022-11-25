import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/screens/academy/lesson_and_plan/edit_lesson_plan/edit_lesson_plan.dart';
import 'package:sportapp/screens/academy/lesson_and_plan/video_player/components/video_lesson_card.dart';
import 'package:sportapp/screens/components/appbar.dart';
import 'package:video_player/video_player.dart';

class LessonVideoPlayer extends StatefulWidget {
  const LessonVideoPlayer({super.key});

  @override
  State<LessonVideoPlayer> createState() => _LessonVideoPlayerState();
}

class _LessonVideoPlayerState extends State<LessonVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(75.h),
            child: CommonAppBar(
              tittle: 'Running',
              color: AppColors.black,
              backColor: AppColors.white,
              elevation: 1,
              navigator: EditLessonPlan(),
            )),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title of Lesson',
                style: Ts.medium18(AppColors.black121213),
              ),
              Container(
                height: 240.h,
                child: VideoItems(
                  videoPlayerController: VideoPlayerController.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
                  looping: false,
                  autoplay: false,
                ),
              ),
              Text(
                'Desciption of Activity',
                style: Ts.medium18(AppColors.black121213),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi proin sed morbi vitae amet. Turpis proin at laoreet nunc, eros, aliquet ornare aliquam rhoncus.',
                style: Ts.regular16(AppColors.grey4C4E53),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: AppColors.greenColor,
                    size: 8,
                  ),
                  SizedBox(
                    width: 8.h,
                  ),
                  Text(
                    'Good for stamina',
                    style: Ts.regular16(AppColors.grey4C4E53),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: AppColors.greenColor,
                    size: 8,
                  ),
                  SizedBox(
                    width: 8.h,
                  ),
                  Text(
                    'Healthy warm up',
                    style: Ts.regular16(AppColors.grey4C4E53),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: AppColors.greenColor,
                    size: 8,
                  ),
                  SizedBox(
                    width: 8.h,
                  ),
                  Text(
                    'Atlease 2km',
                    style: Ts.regular16(AppColors.grey4C4E53),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

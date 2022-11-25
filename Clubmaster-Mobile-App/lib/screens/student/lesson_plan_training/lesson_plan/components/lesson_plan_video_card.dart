import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/images.dart';
import 'package:sportapp/helper/ts.dart';

import 'package:sportapp/screens/components/appbar.dart';
import 'package:sportapp/screens/student/lesson_plan_training/video_player/Lesson_video.dart';
import 'package:video_player/video_player.dart';

class lessonPlanVideocard extends StatefulWidget {
  const lessonPlanVideocard({super.key});

  @override
  State<lessonPlanVideocard> createState() => _lessonPlanVideocardState();
}

class _lessonPlanVideocardState extends State<lessonPlanVideocard> {
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
    return InkWell(
      onTap: (() {
        Get.to(() => LessonVideoPlayer());
      }),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    height: 100.h,
                    width: 110.w,
                    child: Image.asset(AppImages.videoimage)),
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title of Lesson',
                      style: Ts.medium18(AppColors.black121213),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet...',
                      style: Ts.regular12(AppColors.black121213),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '50 Min',
                      style: Ts.medium12(AppColors.black121213),
                    )
                  ],
                ),
                Spacer(),
                Container(
                    height: 20,
                    width: 20,
                    color: Colors.transparent,
                    child: Image.asset(AppImages.play))
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

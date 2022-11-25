import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/screens/academy/lesson_and_plan/lesson_plan/components/lesson_plan_video_card.dart';
import 'package:sportapp/screens/components/appbar.dart';
import 'package:video_player/video_player.dart';

class LessonPlanVideoList extends StatefulWidget {
  const LessonPlanVideoList({super.key});

  @override
  State<LessonPlanVideoList> createState() => _LessonPlanVideoListState();
}

class _LessonPlanVideoListState extends State<LessonPlanVideoList> {
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
            tittle: 'Lesson plan',
            color: AppColors.black,
            backColor: AppColors.white,
            elevation: 1,
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            lessonPlanVideocard(),
            SizedBox(
              height: 20.h,
            ),
            lessonPlanVideocard(),
            SizedBox(
              height: 20.h,
            ),
            lessonPlanVideocard(),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/images.dart';
import 'package:sportapp/helper/ts.dart';

import 'package:sportapp/screens/components/appbar.dart';
import 'package:sportapp/screens/student/lesson_plan_training/lesson_plan/lesson_plan_video_list.dart';
import 'package:sportapp/screens/student/lesson_plan_training/open_lesson_plan/components/open_lesson_card.dart';
import 'package:sportapp/screens/student/lesson_plan_training/video_player/Lesson_video.dart';

class OpenLessonPlan extends StatefulWidget {
  const OpenLessonPlan({super.key});

  @override
  State<OpenLessonPlan> createState() => _OpenLessonPlanState();
}

class _OpenLessonPlanState extends State<OpenLessonPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.h),
          child: CommonAppBar(
            tittle: 'Lesson plan',
            color: AppColors.black,
            backColor: AppColors.white,
            elevation: 0.5,
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lesson Plan",
              style: Ts.medium14(AppColors.black121213),
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: (() {
                Get.to(() => LessonPlanVideoList());
              }),
              child: OpenlessonCard(
                icon: Image.asset(AppImages.running1),
                text: "Running",
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: (() {
                Get.to(() => LessonPlanVideoList());
              }),
              child: OpenlessonCard(
                icon: Image.asset(AppImages.jumper),
                text: "Frog jump",
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: (() {
                Get.to(() => LessonPlanVideoList());
              }),
              child: OpenlessonCard(
                icon: Image.asset(AppImages.football),
                text: "Football Dance ",
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: (() {
                Get.to(() => LessonPlanVideoList());
              }),
              child: OpenlessonCard(
                icon: Image.asset(AppImages.running),
                text: "Footwork Exercise",
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: (() {
                Get.to(() => LessonPlanVideoList());
              }),
              child: OpenlessonCard(
                icon: Image.asset(AppImages.thermometer),
                text: "Cool Down",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

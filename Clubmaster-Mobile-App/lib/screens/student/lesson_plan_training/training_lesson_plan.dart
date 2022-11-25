import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/images.dart';

import 'package:sportapp/screens/components/appbar.dart';
import 'package:sportapp/screens/student/lesson_plan_training/components/lesson_card.dart';
import 'package:sportapp/screens/student/lesson_plan_training/lesson_plan/lesson_plan_video_list.dart';
import 'package:sportapp/screens/student/lesson_plan_training/open_lesson_plan/open_lesson_plan.dart';

class TrainingLessonPlan extends StatefulWidget {
  const TrainingLessonPlan({super.key});

  @override
  State<TrainingLessonPlan> createState() => _TrainingLessonPlanState();
}

class _TrainingLessonPlanState extends State<TrainingLessonPlan> {
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
        padding: const EdgeInsets.only(left: 16, right: 16, top: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (() {
                Get.to(() => OpenLessonPlan());
              }),
              child: LessonCard(
                icon: Image.asset(AppImages.file),
                text: "Open Lesson Plan",
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: (() {
                Get.to(() => LessonPlanVideoList());
              }),
              child: LessonCard(
                icon: Image.asset(AppImages.file),
                text: "Lesson Plan By Coach",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

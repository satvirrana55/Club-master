import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/images.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/screens/academy/lesson_and_plan/components/lesson_card.dart';
import 'package:sportapp/screens/academy/lesson_and_plan/create_leasson_plan/create_lesson_plan.dart';
import 'package:sportapp/screens/academy/lesson_and_plan/lesson_plan/lesson_plan_video_list.dart';
import 'package:sportapp/screens/academy/lesson_and_plan/open_lesson_plan/open_lesson_plan.dart';
import 'package:sportapp/screens/components/appbar.dart';

class LessonPlan extends StatefulWidget {
  const LessonPlan({super.key});

  @override
  State<LessonPlan> createState() => _LessonPlanState();
}

class _LessonPlanState extends State<LessonPlan> {
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
            Text(
              "Select one",
              style: Ts.medium14(AppColors.black121213),
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: (() {
                Get.to(() => CreateLessonPlan());
              }),
              child: LessonCard(
                icon: Image.asset(AppImages.add),
                text: "Create Lesson Plan",
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
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
                text: "My Lesson Plan",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/screens/academy/components/common_button.dart';
import 'package:sportapp/screens/coach/lesson_and_plan/create_leasson_plan/components/create_lesson_dropdown.dart';
import 'package:sportapp/screens/coach/lesson_and_plan/create_leasson_plan/components/create_lesson_textfield.dart';
import 'package:sportapp/screens/coach/lesson_and_plan/create_leasson_plan/components/upload_image.dart';

import 'package:sportapp/screens/components/appbar.dart';

class EditLessonPlan extends StatefulWidget {
  const EditLessonPlan({super.key});

  @override
  State<EditLessonPlan> createState() => _EditLessonPlanState();
}

class _EditLessonPlanState extends State<EditLessonPlan> {
  TextEditingController title = TextEditingController();
  TextEditingController creatActivity = TextEditingController();
  TextEditingController discription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.h),
          child: CommonAppBar(
            tittle: 'Edit Lesson Plan',
            color: AppColors.black,
            backColor: AppColors.white,
            elevation: 1,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 15, top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title', style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CreateTextField(
                textEditingController: title,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text('Select Activity', style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CreateDropdown(),
              SizedBox(
                height: 24.h,
              ),
              Text('Create Activity', style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CreateTextField(
                textEditingController: title,
                lable: 'Enter the activity name',
              ),
              SizedBox(
                height: 24.h,
              ),
              Text('Upload Video', style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              UploadImage(),
              SizedBox(
                height: 24.h,
              ),
              Text('Description', style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CreateTextField(
                textEditingController: title,
                value: 4,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
        child: BottomAppBar(
          elevation: 0,
          child: CommonButton(
            text: 'Submit',
          ),
        ),
      ),
    );
  }
}

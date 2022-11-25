import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/screens/academy/components/common_button.dart';
import 'package:sportapp/screens/academy/lesson_and_plan/create_leasson_plan/components/create_lesson_textfield.dart';
import 'package:sportapp/screens/academy/lesson_and_plan/create_leasson_plan/components/upload_image.dart';
import 'package:sportapp/screens/academy/lesson_and_plan/lesson_and_plan.dart';
import 'package:sportapp/screens/components/appbar.dart';
import 'package:sportapp/screens/components/common_dropdown.dart';
import 'package:intl/intl.dart';
import 'package:sportapp/utils/constants/text_styles.dart';

class CreateTourament extends StatefulWidget {
  const CreateTourament({super.key});

  @override
  State<CreateTourament> createState() => _CreateTouramentState();
}

class _CreateTouramentState extends State<CreateTourament> {
  TextEditingController title = TextEditingController();
  TextEditingController mandRule = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController enddate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.h),
          child: CommonAppBar(
            tittle: 'Create Tournament',
            color: AppColors.black,
            backColor: AppColors.white,
            elevation: 1,
          )),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tittle', style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CreateTextField(
                textEditingController: title,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text('Select Sport', style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CommonDropdown(),
              SizedBox(
                height: 24.h,
              ),
              Text('Type of Tournament',
                  style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CommonDropdown(),
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
              Text('Mandatory Rules', style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CreateTextField(
                textEditingController: mandRule,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text('Team Member per team (Playing)',
                  style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CreateTextField(
                textEditingController: mandRule,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text('Team Member per team (Extra)',
                  style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CreateTextField(
                textEditingController: mandRule,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text('Maximum No. of team register',
                  style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CreateTextField(
                textEditingController: mandRule,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text('Location', style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CreateTextField(
                textEditingController: mandRule,
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Start Date',
                          style: Ts.medium16(AppColors.grey4C4E53)),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        width: 150.w,
                        child: TextField(
                          controller: startDate,
                          decoration: InputDecoration(
                              fillColor: AppColors.textFieldBackgroundColor,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldBackgroundColor,
                                      width: 1)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldBackgroundColor,
                                      width: 1)),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldBackgroundColor,
                                      width: 1)),
                              label: Text('')),
                          readOnly: true,
                          onTap: (() async {
                            DateTime? pickDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1990),
                                lastDate: DateTime(2100));

                            String formatDate =
                                DateFormat('yyyy-MM-dd').format(pickDate!);
                            setState(() {
                              startDate.text = formatDate;
                            });
                          }),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('End Date',
                          style: Ts.medium16(AppColors.grey4C4E53)),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        width: 180.w,
                        child: TextField(
                          controller: enddate,
                          decoration: InputDecoration(
                              fillColor: AppColors.textFieldBackgroundColor,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldBackgroundColor,
                                      width: 1)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldBackgroundColor,
                                      width: 1)),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldBackgroundColor,
                                      width: 1)),
                              label: Text('')),
                          readOnly: true,
                          onTap: (() async {
                            DateTime? pickDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1990),
                                lastDate: DateTime(2100));

                            String formatDate =
                                DateFormat('yyyy-MM-dd').format(pickDate!);
                            setState(() {
                              enddate.text = formatDate;
                            });
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Text('Description', style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CreateTextField(
                textEditingController: mandRule,
                value: 4,
              ),
              SizedBox(
                height: 24.h,
              ),
              InkWell(
                onTap: (() {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    builder: (BuildContext context) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                        child: Stack(
                          children: [
                            Container(
                              height: 427.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(25))),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      "Share Invite",
                                      style: Ts.medium18(AppColors.black),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Divider(
                                            height: 0.5,
                                          ),
                                          SizedBox(
                                            height: 33.h,
                                          ),
                                          Text(
                                            "Your coach has invited you on tournament:",
                                            style: Ts.medium16(AppColors.black),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 16.h,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Title :',
                                                style: Ts.medium14(
                                                    AppColors.black),
                                              ),
                                              SizedBox(
                                                width: 12.w,
                                              ),
                                              Text('Title of the tournamnet',
                                                  style: Ts.regular14(
                                                      AppColors.darkGrey))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Title :',
                                                style: Ts.medium14(
                                                    AppColors.black),
                                              ),
                                              SizedBox(
                                                width: 12.w,
                                              ),
                                              Text('15/07/2022',
                                                  style: Ts.regular14(
                                                      AppColors.darkGrey))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Title :',
                                                style: Ts.medium14(
                                                    AppColors.black),
                                              ),
                                              SizedBox(
                                                width: 12.w,
                                              ),
                                              Text('20/07/2022',
                                                  style: Ts.regular14(
                                                      AppColors.darkGrey))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 29.h,
                                          ),
                                          Text(
                                            "Enroll for the tournament on Club Master app :",
                                            style: Ts.medium16(AppColors.black),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Text(
                                            'http://www.clubmaster.com',
                                            style: Ts.regular14(AppColors.blue),
                                          ),
                                          SizedBox(
                                            height: 37.24.h,
                                          ),
                                          InkWell(
                                            onTap: (() {}),
                                            child: Container(
                                                height: 56.h,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: AppColors.greenColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                25))),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.whatsapp,
                                                        color: AppColors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 10.h,
                                                      ),
                                                      Text(
                                                        'Share on WhatsApp',
                                                        style: Ts.semiBold14(
                                                            AppColors.white),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                top: 2,
                                right: 15,
                                child: InkWell(
                                    onTap: (() {
                                      Navigator.pop(context);
                                    }),
                                    child: Icon(Icons.cancel_outlined)))
                          ],
                        ),
                      );
                    },
                  );
                }),
                child: CommonButton(
                  text: 'Submit',
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

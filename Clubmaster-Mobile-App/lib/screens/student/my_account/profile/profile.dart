import 'dart:math';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sportapp/controller/academy_controllers/verify_otp_controller.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/images.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/module/get_state_list_module.dart';
import 'package:sportapp/screens/components/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportapp/screens/components/common_dropdown.dart';
import 'package:sportapp/screens/student/my_account/profile/components/dropdown.dart';
import 'package:sportapp/screens/student/my_account/profile/components/profle_text_field.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final VerifyOtpController verifyOtpController =
      Get.isRegistered<VerifyOtpController>()
          ? Get.find<VerifyOtpController>()
          : Get.put(VerifyOtpController());
  TextEditingController username =
      TextEditingController(text: 'rahulvaidya@gmail.com');
  TextEditingController name = TextEditingController(text: 'Rahul Vaidya');
  TextEditingController phone = TextEditingController(text: '9865214789');
  TextEditingController email =
      TextEditingController(text: 'rahulvaidya@gmail.com');
  TextEditingController bio = TextEditingController();
  TextEditingController datePick = TextEditingController(text: '11 May 1980');
  TextEditingController city = TextEditingController(text: 'Pune');
  TextEditingController address =
      TextEditingController(text: '6391 Elgin St. Celina, Delaware 10299');
  String? gender;

  String? myspotrs;
  var items = [
    'Running',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  setValueFuntionMySports(value) {
    setState(() {
      myspotrs = value;
    });
    print('this is a test $value');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.h),
          child: CommonAppBar(
            tittle: 'My Badges',
            color: AppColors.white,
            backColor: AppColors.greenColor,
            elevation: 0,
          )),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 218.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: Ts.medium14(AppColors.grey4C4E53),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      ProfileTextField(
                        textEditingController: username,
                        ImageIcon: ImageIcon(
                            color: AppColors.greenColor,
                            AssetImage(AppImages.person)),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Name',
                        style: Ts.medium14(AppColors.grey4C4E53),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      ProfileTextField(
                        textEditingController: name,
                        ImageIcon: ImageIcon(
                            color: AppColors.greenColor,
                            AssetImage(AppImages.person)),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Phone',
                        style: Ts.medium14(AppColors.grey4C4E53),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      ProfileTextField(
                          textEditingController: phone,
                          ImageIcon: Icon(
                              color: AppColors.greenColor,
                              Icons.call_outlined)),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Email ID',
                        style: Ts.medium14(AppColors.grey4C4E53),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      ProfileTextField(
                          textEditingController: email,
                          ImageIcon: Icon(
                              color: AppColors.greenColor,
                              Icons.email_outlined)),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Bio',
                        style: Ts.medium14(AppColors.grey4C4E53),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      ProfileTextField(
                        textEditingController: bio,
                        value: 4,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'DOB',
                        style: Ts.medium14(AppColors.grey4C4E53),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        color: AppColors.textFieldBackgroundColor,
                        child: TextField(
                          controller: datePick,
                          decoration: InputDecoration(
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: Icon(
                                  Icons.calendar_today,
                                  color: AppColors.greenColor,
                                ),
                              ),
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
                              datePick.text = formatDate;
                            });
                          }),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'My Sports',
                        style: Ts.medium14(AppColors.grey4C4E53),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      ProfileDropdown(
                        statListModule: verifyOtpController.stateList,
                        dropdownvalue: "Select",
                        function: setValueFuntionMySports,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Address',
                        style: Ts.medium14(AppColors.grey4C4E53),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      ProfileTextField(
                          textEditingController: address,
                          ImageIcon: Icon(
                              color: AppColors.greenColor,
                              Icons.location_on_outlined)),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'City',
                        style: Ts.medium14(AppColors.grey4C4E53),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      ProfileTextField(
                        textEditingController: city,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Country',
                        style: Ts.medium14(AppColors.grey4C4E53),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      CommonDropdown(),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'State',
                        style: Ts.medium14(AppColors.grey4C4E53),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      CommonDropdown(),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Select Gender*',
                        style: Ts.medium14(AppColors.grey4C4E53),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            activeColor: AppColors.greenColor,
                            value: 'male',
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                print(value);
                                gender = value;
                              });
                            },
                          ),
                          Text(
                            'Male',
                            style: Ts.medium14(AppColors.grey4C4E53),
                          ),
                          Radio<String>(
                            activeColor: AppColors.greenColor,
                            value: 'Female',
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                print(value);
                                gender = value;
                              });
                            },
                          ),
                          Text(
                            'Female',
                            style: Ts.medium14(AppColors.grey4C4E53),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                top: 20,
                child: Container(
                  height: 237.h,
                  width: 396.w,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Image.asset(AppImages.img1),
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      Text(
                        'Rahul Vaidya',
                        style: Ts.medium18(AppColors.white),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

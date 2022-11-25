import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/screens/academy/academy_registration/AcadmyRegistration.dart';
import 'package:sportapp/screens/authentication/login/LoginScreen.dart';
import 'package:sportapp/screens/authentication/sign_up/SignUpScreen.dart';
import 'package:sportapp/screens/components/button.dart';
import 'package:sportapp/screens/components/dashbord_card.dart';
import 'package:sportapp/utils/constants/text_styles.dart';

class SelectionScreen extends StatefulWidget {
  final bool isComeFromCreateAccount;
  const SelectionScreen({Key? key, required this.isComeFromCreateAccount})
      : super(key: key);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  final gridsImgArr = [
    "Group 1.png",
    "Group 2.png",
    "Group 3.png",
    "Group 4.png",
    "Group 5.png"
  ];
  var index1 = 0;
  var index2 = 0;
  var index3 = 0;
  var index4 = 0;
  var index5 = 0;
  var currentIndex;
  bool select = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: Text("Select Your Role",
                    style: AppTextStyles.textSize18WithWeight600Black),
              ),
              SizedBox(
                height: 24.h,
              ),
              Center(
                child: Text("Explore the app as  per your best suited role",
                    style: AppTextStyles.textSize14WithWeight400Black),
              ),
              SizedBox(
                height: 36.h,
              ),
              Wrap(
                runSpacing: 36,
                spacing: 37,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        index1 = 1;
                        index2 = 0;
                        index3 = 0;
                        index4 = 0;
                        index5 = 0;
                        select = true;
                        currentIndex = index1;
                      });
                    },
                    child: DashboardCard(
                      image: Image.asset("assets/images/Group 1.png"),
                      index: index1,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        index1 = 0;
                        index2 = 2;
                        index3 = 0;
                        index4 = 0;
                        index5 = 0;
                        select = true;
                        currentIndex = index2;
                      });
                    },
                    child: DashboardCard(
                      image: Image.asset("assets/images/Group 2.png"),
                      index: index2,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        index1 = 0;
                        index2 = 0;
                        index3 = 3;
                        index4 = 0;
                        index5 = 0;
                        select = true;
                        currentIndex = index3;
                      });
                    },
                    child: DashboardCard(
                      image: Image.asset("assets/images/Group 3.png"),
                      index: index3,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        index1 = 0;
                        index2 = 0;
                        index3 = 0;
                        index4 = 4;
                        index5 = 0;
                        select = true;
                        currentIndex = index4;
                      });
                    },
                    child: DashboardCard(
                      image: Image.asset("assets/images/Group 4.png"),
                      index: index4,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        index1 = 0;
                        index2 = 0;
                        index3 = 0;
                        index4 = 0;
                        index5 = 5;
                        select = true;
                        currentIndex = index5;
                      });
                    },
                    child: DashboardCard(
                      image: Image.asset("assets/images/Group 5.png"),
                      index: index5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: select == true
          ? Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                right: 16.h,
                bottom: 30.h,
              ),
              child: Button(
                text: 'Next',
                currentIndex: currentIndex,
              ),
            )
          : SizedBox(),
    );
  }
}

enum SelectionOfTypeOfUser { student, coach, academy, parents, saller }

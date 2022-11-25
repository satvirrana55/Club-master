import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sportapp/controller/academy_controllers/verify_otp_controller.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/images.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/screens/components/appbar.dart';
import 'package:sportapp/screens/student/my_account/profile/profile.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final VerifyOtpController verifyOtpController =
      Get.isRegistered<VerifyOtpController>()
          ? Get.find<VerifyOtpController>()
          : Get.put(VerifyOtpController());
  @override
  void initState() {
    // TODO: implement initState
    verifyOtpController.getStateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            Container(
              height: 250.h,
              width: MediaQuery.of(context).size.width,
              color: AppColors.lightgreen,
              child: Column(
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Rahul Vaidya',
                    style: Ts.medium18(AppColors.black121213),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                      height: 99.h,
                      width: 99.h,
                      child: Image.asset(AppImages.bage)),
                  SizedBox(
                    height: 23.h,
                  ),
                  Text(
                    'Under 11-IRON1',
                    style: Ts.medium16(AppColors.greenColor),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Football',
                    style: Ts.medium14(AppColors.grey4C4E53),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            InkWell(
              onTap: (() {
                Get.to(() => Profile());
              }),
              child: Container(
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 5),
                        height: 37.h,
                        width: 37.w,
                        child: Image.asset(AppImages.person)),
                    SizedBox(
                      width: 24.w,
                    ),
                    Text(
                      'My Profile',
                      style: Ts.medium16(AppColors.black121213),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 16,
                    ),
                    SizedBox(
                      width: 16.w,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              child: Row(
                children: [
                  Image.asset(AppImages.academy),
                  SizedBox(
                    width: 24.w,
                  ),
                  Text(
                    'My Academy',
                    style: Ts.medium16(AppColors.black121213),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 16,
                  ),
                  SizedBox(
                    width: 16.w,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

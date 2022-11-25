import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/screens/components/appbar.dart';
import 'package:sportapp/screens/components/common_dropdown.dart';
import 'package:sportapp/screens/student/my_badge/components/my_badges_card.dart';
import 'package:sportapp/screens/student/my_badge/my_badge_details/my_badge_details.dart';

class MyBadges extends StatefulWidget {
  const MyBadges({super.key});

  @override
  State<MyBadges> createState() => _MyBadgesState();
}

class _MyBadgesState extends State<MyBadges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.h),
          child: CommonAppBar(
            tittle: 'My Badges',
            color: AppColors.black,
            backColor: AppColors.white,
            elevation: 1,
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Sports', style: Ts.medium16(AppColors.grey4C4E53)),
            SizedBox(
              height: 12.h,
            ),
            CommonDropdown(),
            SizedBox(
              height: 24.h,
            ),
            Text('Select Sports', style: Ts.medium16(AppColors.grey4C4E53)),
            SizedBox(
              height: 12.h,
            ),
            CommonDropdown(),
            SizedBox(
              height: 24.h,
            ),
            Text('My Badge', style: Ts.medium16(AppColors.grey4C4E53)),
            SizedBox(
              height: 12.h,
            ),
            InkWell(
                onTap: (() {
                  Get.to(() => MybadgeDetails());
                }),
                child: MyBadgescard())
          ],
        ),
      ),
    );
  }
}

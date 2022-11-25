import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/screens/coach/my_academy/components/my_academy_card.dart';
import 'package:sportapp/screens/components/appbar.dart';

class CoachMyAcademy extends StatefulWidget {
  const CoachMyAcademy({super.key});

  @override
  State<CoachMyAcademy> createState() => _CoachMyAcademyState();
}

class _CoachMyAcademyState extends State<CoachMyAcademy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.h),
          child: CommonAppBar(
            tittle: 'My Academy',
            color: AppColors.black,
            backColor: AppColors.white,
            elevation: 1,
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyAcademyCard(),
            SizedBox(
              height: 24.h,
            ),
            MyAcademyCard(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/images.dart';
import 'package:sportapp/helper/ts.dart';

class MyAcademyCard extends StatefulWidget {
  const MyAcademyCard({super.key});

  @override
  State<MyAcademyCard> createState() => _MyAcademyCardState();
}

class _MyAcademyCardState extends State<MyAcademyCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 98.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            /*  boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2),
              ),
            ], */
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AppImages.academy),
              SizedBox(
                width: 33.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Academy Name',
                    style: Ts.medium16(AppColors.black121213),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text('Football', style: Ts.medium14(AppColors.grey4C4E53)),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text('Pune, India', style: Ts.medium14(AppColors.grey4C4E53)),
                ],
              )
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}

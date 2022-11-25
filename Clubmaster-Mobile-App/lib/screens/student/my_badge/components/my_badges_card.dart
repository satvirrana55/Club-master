import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/images.dart';
import 'package:sportapp/helper/ts.dart';

class MyBadgescard extends StatefulWidget {
  const MyBadgescard({super.key});

  @override
  State<MyBadgescard> createState() => _MyBadgescardState();
}

class _MyBadgescardState extends State<MyBadgescard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(AppImages.bage1),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              )
            ],
          )
        ],
      ),
    );
  }
}

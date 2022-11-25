import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportapp/helper/colors.dart';

class DashboardCard extends StatefulWidget {
  final Image? image;
  final int? index;
  const DashboardCard({super.key, this.image, this.index});

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: 180.h,
            height: 180.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: widget.image,
          ),
          widget.index != 0
              ? Container(
                  margin: EdgeInsets.only(left: 125, right: 0, top: 10),
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: AppColors.greenColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}

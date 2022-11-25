import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/screens/academy/lesson_and_plan/edit_lesson_plan/edit_lesson_plan.dart';

class CommonAppBar extends StatefulWidget {
  final String tittle;
  final value;
  final Color? color;
  final Widget? navigator;
  final double? elevation;
  final Color? backColor;
  final Icon? icon;

  const CommonAppBar(
      {Key? key,
      required this.tittle,
      this.value,
      this.color,
      this.navigator,
      this.elevation,
      this.backColor,
      this.icon})
      : super(key: key);

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100.sp,
        elevation: widget.elevation ?? 0,
        backgroundColor: widget.backColor,
        title: Text(
          widget.tittle,
          style: Ts.medium18(widget.color as Color),
        ),
        leading: BackButton(
          color: widget.color as Color,
        ),
        actions: <Widget>[
          /* IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_none)), */
          if (widget.value != null)
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 15),
                child: InkWell(
                  onTap: (() {
                    Get.to(() => EditLessonPlan());
                  }),
                  child: Icon(
                    Icons.edit_calendar_outlined,
                    color: AppColors.greenColor,
                  ),
                )),
        ],
      ),
    );
  }
}

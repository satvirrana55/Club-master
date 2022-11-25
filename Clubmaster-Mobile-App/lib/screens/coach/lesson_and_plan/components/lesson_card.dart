import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/ts.dart';

class LessonCard extends StatefulWidget {
  final Image? icon;
  final String? text;
  const LessonCard({super.key, this.icon, this.text});

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 16),
        height: 72.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 100,
                  offset: Offset(4, 10))
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
            border: Border.all(
                width: 0.5, color: Color.fromARGB(255, 250, 247, 247))),
        child: Row(
          children: [
            widget.icon as Image,
            SizedBox(
              width: 16.w,
            ),
            Text(
              widget.text as String,
              style: Ts.medium16(AppColors.black121213),
            ),
            const Spacer(),
            /*  IconButton(
            icon: const Icon(Icons.arrow_forward_ios,
                size: 16, color: Color.fromRGBO(73, 79, 89, 1)),
            onPressed: () {},
          ), */
          ],
        ));
  }
}

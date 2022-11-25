import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/screens/selection_screen/SelectionScreen.dart';

class CommonButton extends StatelessWidget {
  final String? text;
  final Widget? function;
  final int? currentIndex;
  const CommonButton({super.key, this.text, this.function, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.greenColor,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Center(
          child: Text(
            '$text',
            style: Ts.semiBold16(AppColors.white),
          ),
        ));
  }
}

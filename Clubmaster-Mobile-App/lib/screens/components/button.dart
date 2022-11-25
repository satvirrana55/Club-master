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

import '../authentication/login/LoginScreen.dart';

class Button extends StatelessWidget {
  final String? text;
  final Function? function;
  final int? currentIndex;
  const Button({super.key, this.text, this.function, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      color: AppColors.white,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: AppColors.greenColor,
          fixedSize: Size(258.w, 45),
          textStyle: GoogleFonts.poppins(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              50.0,
            ),
          ),
        ),
        child: Text(
          "$text",
          style: Ts.semiBold16(AppColors.white),
        ),
        onPressed: (() {
          print("dkwedhwdjo $currentIndex}");
          Get.to(() => LoginScreen(
                currentIndex: currentIndex,
              ));
        }),
      ),
    );
  }
}

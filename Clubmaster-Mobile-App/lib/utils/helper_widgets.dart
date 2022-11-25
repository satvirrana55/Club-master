import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:sportapp/helper/images.dart';

import '../helper/colors.dart';
import '../helper/strings.dart';
import 'constants/text_styles.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height.h,
  );
}

Widget addHorizontalSpace(double width) {
  return SizedBox(
    width: width.w,
  );
}

AppBar appbarWidget(context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: ImageIcon(
        AssetImage(AppImages.arrowBack),
        color: AppColors.iconBlack,
        size: 24,
      ),
    ),
  );
}

AppBar textAppBar(BuildContext context, String text,
    {Color color = AppColors.skyBlue}) {
  return AppBar(
    backgroundColor: color,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.iconBlack,
          size: 20,
        )),
    title: Text(
      text,
      style: AppTextStyles.textSize18WithWeight500Black,
    ),
    centerTitle: true,
    elevation: 0.2,
    toolbarHeight: 70,
  );
}

Widget dashboardContainer(
    Color? boxColor, String text, String image_path, function) {
  return InkWell(
    onTap: function,
    child: Container(
      width: 190.w,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          addVerticalSpace(18),
          Image.asset(image_path),
          addVerticalSpace(8),
          Text(
            text,
            style: AppTextStyles.textSize14WithWeight500Black,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}

Padding divider(double left, double right) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 12.0),
    child: Divider(
      color: AppColors.borderColor,
      thickness: 1,
    ),
  );
}

Widget checkboxText(String text) {
  bool checkBoxValue = false;
  return StatefulBuilder(
    builder: (context, setState) => ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Theme(
        child: Checkbox(
          value: checkBoxValue,
          onChanged: (bool? value) {
            setState(() {
              checkBoxValue = value!;
            });
          },
        ),
        data: ThemeData(
          primarySwatch: Colors.blue,
          unselectedWidgetColor: AppColors.checkBoxBlueColor, // Your color
        ),
      ),
      title: Text(
        text,
        style: AppTextStyles.textSize16WithWeight500Black,
      ),
    ),
  );
}

void alertDialogForSubcategories(BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: MediaQuery.of(context).size.height *
                0.8, // Change as per your requirement
            width: MediaQuery.of(context).size.width *
                0.9, // Change as per your requirement
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 11,
              itemBuilder: (BuildContext context, int index) {
                return checkboxText(AppStrings.standard_1_to_5);
              },
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: borderButton(context, AppStrings.cancel, () {
                    Navigator.pop(context);
                  }),
                ),
                addHorizontalSpace(12),
                Expanded(
                  child: AppButton(
                    color: AppColors.blue,
                    text: AppStrings.submit,
                    textStyle: AppTextStyles.textSize18WithWeight600White,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

InkWell borderButton(BuildContext context, String text, function) {
  return InkWell(
    onTap: function,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          border: Border.all(color: AppColors.blue)),
      child: Padding(
        padding: const EdgeInsets.only(top: 13.0, bottom: 13),
        child: Center(
            child: Text(
          text,
          style: AppTextStyles.textSize18WithWeight600Blue,
        )),
      ),
    ),
  );
}

TableRow customTableRow(String heading, String value) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(heading,
          textAlign: TextAlign.center,
          style: AppTextStyles.textSize14WithWeight400Grey),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(value,
          textAlign: TextAlign.center,
          style: AppTextStyles.textSize14WithWeight500Black),
    ),
  ]);
}

Container CourseCard(
    String courseImage, String courseTitle, String coursePrice) {
  return Container(
    width: 192.w,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 134,
          width: 192,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(courseImage))),
        ),
        8.height,
        Text(
          courseTitle,
          style: AppTextStyles.textSize12WithWeight500Black,
        ),
        4.height,
        Text(
          coursePrice,
          style: AppTextStyles.textSize13WithWeight500Black,
        )
      ],
    ),
  );
}

Row HeadingRow(String startingValue, String secondValue) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        startingValue,
        style: AppTextStyles.textSize14WithWeight500Black,
      ),
      Text(
        secondValue,
        style: AppTextStyles.textSize14WithWeight500Blue,
      )
    ],
  );
}

InkWell gridContainer(String icon, Color iconColor, Color iconBackGroundColor,
    String title, onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 188.w,
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              offset: const Offset(
                0,
                1,
              ),
              blurRadius: 5.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: iconBackGroundColor, shape: BoxShape.circle),
              child: Center(
                  child: ImageIcon(
                AssetImage(
                  icon,
                ),
                size: 24.0,
                color: iconColor,
              )),
            ),
            10.height,
            Text(
              title,
              style: AppTextStyles.textSize16WithWeight500Black,
            ),
            8.height,
          ],
        ),
      ),
    ),
  );
}

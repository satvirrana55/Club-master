import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/ts.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
      ),
      height: 54.h,
      decoration: BoxDecoration(
          color: AppColors.textFieldBackgroundColor,
          border:
              Border.all(color: AppColors.textFieldBackgroundColor, width: .5),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        children: [
          Icon(
            Icons.file_upload_outlined,
            color: AppColors.greenColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.textFieldBackgroundColor,
                  border: Border.all(color: AppColors.greenColor, width: .5),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Choose File',
                    style: Ts.regular14(AppColors.black),
                  )),
            ),
          ),
          SizedBox(
            width: 20.h,
          ),
          Text('No file choosen',
              style: Ts.regular12(
                AppColors.grey494F59,
              )),
        ],
      ),
    );
  }
}

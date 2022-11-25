import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/screens/academy/components/common_button.dart';
import 'package:sportapp/screens/components/appbar.dart';
import 'package:sportapp/screens/components/common_dropdown.dart';

class AssessofStudents extends StatefulWidget {
  const AssessofStudents({super.key});

  @override
  State<AssessofStudents> createState() => _AssessofStudentsState();
}

class _AssessofStudentsState extends State<AssessofStudents> {
  bool val1 = true;
  bool val2 = true;
  bool val3 = false;
  bool val4 = false;
  bool val5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(75.h),
            child: CommonAppBar(
              tittle: 'Assess a Students',
              color: AppColors.black,
              backColor: AppColors.white,
              elevation: 1,
            )),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select Student', style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CommonDropdown(),
              SizedBox(
                height: 24.h,
              ),
              Text('Select Sport', style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CommonDropdown(),
              SizedBox(
                height: 24.h,
              ),
              Text('Assessment Level',
                  style: Ts.medium16(AppColors.grey4C4E53)),
              SizedBox(
                height: 12.h,
              ),
              CommonDropdown(),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Checkbox(
                      side:
                          BorderSide(width: 1.sp, color: AppColors.greenColor),
                      value: val1,
                      activeColor: AppColors.greenColor,
                      onChanged: (value) {
                        setState(() {
                          val1 = value as bool;
                        });
                      }),
                  Text(
                    'Able to Complete the session (45 minutes)',
                    style: Ts.medium14(AppColors.black121213),
                  )
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      side:
                          BorderSide(width: 1.sp, color: AppColors.greenColor),
                      value: val1,
                      activeColor: AppColors.greenColor,
                      onChanged: (value) {
                        setState(() {
                          val1 = value as bool;
                        });
                      }),
                  Text(
                    '	Able to run 75m in just one go.',
                    style: Ts.medium14(AppColors.black121213),
                  )
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      side:
                          BorderSide(width: 1.sp, color: AppColors.greenColor),
                      value: val2,
                      activeColor: AppColors.greenColor,
                      onChanged: (value) {
                        setState(() {
                          val2 = value as bool;
                        });
                      }),
                  Text(
                    '	Actively participate in recreational activities',
                    style: Ts.medium14(AppColors.black121213),
                  )
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      side:
                          BorderSide(width: 1.sp, color: AppColors.greenColor),
                      value: val3,
                      activeColor: AppColors.greenColor,
                      onChanged: (value) {
                        setState(() {
                          val3 = value as bool;
                        });
                      }),
                  Text(
                    'Able to dribble ball up-to 30m',
                    style: Ts.medium14(AppColors.black121213),
                  )
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      side:
                          BorderSide(width: 1.sp, color: AppColors.greenColor),
                      value: val4,
                      activeColor: AppColors.greenColor,
                      onChanged: (value) {
                        setState(() {
                          val4 = value as bool;
                        });
                      }),
                  Text(
                    '	Actively participate in recreational activities',
                    style: Ts.medium14(AppColors.black121213),
                  )
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
          child: BottomAppBar(
            elevation: 0,
            child: CommonButton(
              text: 'Submit',
            ),
          ),
        ));
  }
}

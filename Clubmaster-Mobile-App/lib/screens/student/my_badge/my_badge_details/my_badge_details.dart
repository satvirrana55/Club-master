import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/images.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/screens/components/appbar.dart';

class MybadgeDetails extends StatefulWidget {
  const MybadgeDetails({super.key});

  @override
  State<MybadgeDetails> createState() => _MybadgeDetailsState();
}

class _MybadgeDetailsState extends State<MybadgeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.h),
          child: CommonAppBar(
            tittle: 'My Badges',
            color: AppColors.white,
            backColor: AppColors.greenColor,
            elevation: 0,
          )),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 218.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.greenColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    Image.asset(AppImages.cal),
                    SizedBox(
                      width: 24.w,
                    ),
                    Text(
                      'June 1st, 2022',
                      style: Ts.medium12(AppColors.black121213),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    Image.asset(AppImages.circle),
                    SizedBox(
                      width: 24.w,
                    ),
                    Text(
                      'Football',
                      style: Ts.medium12(AppColors.black121213),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    Image.asset(AppImages.menu),
                    SizedBox(
                      width: 24.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: AppColors.greenColor,
                                size: 10,
                              ),
                              SizedBox(
                                width: 8.h,
                              ),
                              Text(
                                '	Able to Complete the session (45 minutes)',
                                style: Ts.medium12(AppColors.black121213),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: AppColors.greenColor,
                                size: 10,
                              ),
                              SizedBox(
                                width: 8.h,
                              ),
                              Text(
                                '	Able to run 75m in just one go.',
                                style: Ts.medium12(AppColors.black121213),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: AppColors.greenColor,
                                size: 10,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'June 1st, 2022',
                                style: Ts.medium12(AppColors.black121213),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 40,
              child: Container(
                height: 237.h,
                width: 396.w,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ],
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.asset(AppImages.bage2),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'Under 11-IRON1',
                      style: Ts.medium16(AppColors.greenColor),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

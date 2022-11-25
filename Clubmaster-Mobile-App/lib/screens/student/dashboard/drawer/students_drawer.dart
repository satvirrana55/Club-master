import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/images.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/screens/student/my_academy/my_academy.dart';

class StudentsDrawer extends StatefulWidget {
  const StudentsDrawer({Key? key}) : super(key: key);

  @override
  State<StudentsDrawer> createState() => _StudentsDrawerState();
}

class _StudentsDrawerState extends State<StudentsDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .786.h,
            margin: const EdgeInsets.all(10),
            width: 350.w,
            child: ListView(
              children: [
                Container(
                  height: 100.h,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Get.toNamed(MyRouter.homeScreenAstrologer);
                        },
                        child: Container(
                          height: 80.h,
                          width: 80.h,
                          child: const CircleAvatar(
                              backgroundImage: AssetImage(AppImages.profile1)),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dianne Russell",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Student",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 20,
                            color: Color.fromRGBO(120, 120, 122, 1),
                          ))
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: 28.h,
                ),
                InkWell(
                    onTap: () {
                      Get.to(() => const MyAcademy());
                    },
                    child: commondrawerContainer(
                        ImageIcon(AssetImage(AppImages.plus)), "My Academy")),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                    onTap: () {
                      //    Get.to(() => const Faq());
                    },
                    child: commondrawerContainer(
                        ImageIcon(AssetImage(AppImages.info)), "My Coach")),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                    onTap: () {
                      //  Get.toNamed(MyRouter.homeScreenAstrologer);
                    },
                    child: commondrawerContainer(
                        ImageIcon(AssetImage(AppImages.help)),
                        "Help and Support")),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                    onTap: () {
                      //  Get.toNamed(MyRouter.homeScreenAstrologer);
                    },
                    child: commondrawerContainer(
                        ImageIcon(AssetImage(AppImages.rate)),
                        "Rate Club Master")),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                    onTap: () {
                      //  Get.toNamed(MyRouter.homeScreenAstrologer);
                    },
                    child: commondrawerContainer(
                        ImageIcon(AssetImage(AppImages.settings)),
                        "Settingst")),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                    onTap: () {},
                    child: commondrawerContainer(
                        ImageIcon(AssetImage(AppImages.logout)), "Logout")),
              ],
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            child: Container(
              height: 200.h,
              color: AppColors.greenColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 52),
                      child: Center(
                          child: Container(
                              height: 40.h,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset(AppImages.mainLogo))),
                    ),
                    SizedBox(
                      height: 49.h,
                    ),
                    Divider(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Privacy Policy",
                            style: Ts.medium14(AppColors.white),
                          ),
                        ),
                        /*  */
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Terms of Services",
                            style: Ts.medium14(AppColors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Container commondrawerContainer(icon, text) {
  icon;
  text;
  return Container(
      height: 48.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
          border: Border.all(width: 0, color: Colors.transparent)),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 32.w,
          ),
          Text(text, style: Ts.medium14(AppColors.black222222)),
          const Spacer(),
          /*  IconButton(
            icon: const Icon(Icons.arrow_forward_ios,
                size: 16, color: Color.fromRGBO(73, 79, 89, 1)),
            onPressed: () {},
          ), */
        ],
      ));
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/images.dart';
import 'package:sportapp/screens/components/appbar.dart';
import 'package:sportapp/screens/parents/dashboard/drawer/parents_drawer.dart';
import 'package:sportapp/screens/parents/dashboard/home.dart';
import 'package:sportapp/screens/student/my_account/my_account.dart';

class BottomNavigationBarParents extends StatefulWidget {
  const BottomNavigationBarParents({super.key});

  @override
  State<BottomNavigationBarParents> createState() =>
      _BottomNavigationBarParentsState();
}

class _BottomNavigationBarParentsState
    extends State<BottomNavigationBarParents> {
  int _currentIndex = 0;
  static const List<Widget> _tabs = <Widget>[
    ParentsHomeScreen(),
    ParentsHomeScreen(),
    ParentsHomeScreen(),
    ParentsHomeScreen(),
    MyAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _currentIndex == 0
            ? AppBar(
                centerTitle: true,
                toolbarHeight: 75.sp,
                elevation: 0,
                backgroundColor: AppColors.greenColor,
                title: Container(
                    height: 35.h, child: Image.asset(AppImages.mainLogo)),
                leading: Builder(builder: (BuildContext context) {
                  return Padding(
                      padding: EdgeInsets.only(left: 20.sp, top: 5),
                      child: SizedBox(
                          height: 16.sp,
                          width: 17.sp,
                          child: IconButton(
                            icon: const Icon(
                              Icons.menu,
                            ),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          )));
                }),
                actions: <Widget>[
                  IconButton(
                      onPressed: () {
                        //  Get.to(() => const NotificationUpdesh());
                      },
                      icon: const Icon(Icons.notifications_none)),
                ],
              )
            : _currentIndex == 1
                ? PreferredSize(
                    preferredSize: Size.fromHeight(75.h),
                    child: CommonAppBar(
                      tittle: 'LOGO',
                      color: Colors.white,
                      backColor: AppColors.greenColor,
                    ))
                : _currentIndex == 2
                    ? PreferredSize(
                        preferredSize: Size.fromHeight(75.h),
                        child: CommonAppBar(
                          tittle: 'LOGO',
                          color: Colors.white,
                          backColor: AppColors.greenColor,
                        ))
                    : PreferredSize(
                        preferredSize: Size.fromHeight(75.h),
                        child: CommonAppBar(
                          tittle: 'LOGO',
                          color: Colors.white,
                          backColor: AppColors.greenColor,
                        )),
        drawer: const ParentsDrawer(),
        body: _tabs[_currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(0),
            topLeft: Radius.circular(0),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: BottomNavigationBar(
              selectedFontSize: 0,
              unselectedFontSize: 0,
              elevation: 5,
              backgroundColor: AppColors.white,
              selectedItemColor: AppColors.greenColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: _currentIndex == 0
                        ? Icon(
                            Icons.home,
                            color: AppColors.greenColor,
                          )
                        : Icon(
                            Icons.home,
                            color: Colors.grey.shade600,
                          ),
                    label: '',
                    backgroundColor: Colors.grey.shade700),
                BottomNavigationBarItem(
                  icon: _currentIndex == 1
                      ? ImageIcon(AssetImage(AppImages.schedule))
                      : ImageIcon(AssetImage(AppImages.schedule)),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: _currentIndex == 2
                        ? Icon(
                            Icons.shopping_cart,
                            color: AppColors.greenColor,
                          )
                        : Icon(
                            Icons.shopping_cart,
                            color: Colors.grey.shade600,
                          ),
                    label: '',
                    backgroundColor: Colors.green),
                BottomNavigationBarItem(
                    icon: _currentIndex == 3
                        ? ImageIcon(AssetImage(AppImages.chat))
                        : ImageIcon(AssetImage(AppImages.chat)),
                    label: '',
                    backgroundColor: Colors.green),
                BottomNavigationBarItem(
                    icon: _currentIndex == 4
                        ? Icon(
                            Icons.person,
                            color: AppColors.greenColor,
                          )
                        : Icon(
                            Icons.person,
                            color: Colors.grey.shade600,
                          ),
                    label: '',
                    backgroundColor: Colors.green),
              ],
              onTap: (index) {
                print(index);
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding/onboarding.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:sportapp/screens/authentication/login/LoginScreen.dart';
import 'package:sportapp/screens/selection_screen/SelectionScreen.dart';

import '../../helper/colors.dart';
import '../../utils/constants/text_styles.dart';

Size textButtonFixedSize = Size(258.w, 40);

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _items = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.pink,
  ];

  final _pageController = PageController();

  final _currentPageNotifier = ValueNotifier<int>(0);

  final arrTextHeader = [
    "Lorem ipsum dolor sit",
    "Lorem ipsum dolor sit",
    "Lorem ipsum dolor sit",
    "Lorem ipsum dolor sit"
  ];

  final arrTextFooter = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CirclePageIndicator Demo'),
      ),
      body: Column(
        children: [
          Expanded(child: _buildBody(context)),
          TextButton(
            onPressed: () {
              Get.to(SelectionScreen(
                isComeFromCreateAccount: true,
              ));
            },
            style: TextButton.styleFrom(
              alignment: Alignment.center,
              backgroundColor: AppColors.greenColor,
              fixedSize: textButtonFixedSize,
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
              "Create Account",
              style: GoogleFonts.poppins(
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Get.to(SelectionScreen(
                isComeFromCreateAccount: false,
              ));
            },
            child: Text(
              "Login",
              style: GoogleFonts.poppins(
                  color: AppColors.greenColor, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget _buildBody(context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 30),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40.h,
            child: Image.asset(
              "assets/images/mainlogo.png",
              color: Colors.black,
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            _buildPageView(context),
          ],
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildCircleIndicator2(),
            ]
                .map((item) => Padding(
                      child: item,
                      padding: EdgeInsets.all(8.0),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  _buildPageView(context) {
    return Container(
      //color: Colors.black87,
      height: MediaQuery.of(context).size.height / 2,
      child: PageView.builder(
          itemCount: _items.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  height: 239,
                  child: Center(
                      child: Image.asset("assets/images/onbourdscreen.png")),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Text(
                    arrTextHeader[index],
                    style: AppTextStyles.textSize24WithWeight600Black,
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Text(
                      arrTextFooter[index],
                      style: AppTextStyles.textSize16WithWeight500Black,
                      textAlign: TextAlign.center,
                    ))
              ],
            );
          },
          onPageChanged: (int index) {
            setState(() {
              _currentPageNotifier.value = index;
            });
          }),
    );
  }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: _items.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }

  _buildCircleIndicator2() {
    return Opacity(
      opacity: 1.0,
      child: CirclePageIndicator(
        size: 12.0,
        selectedSize: 16.0,
        // selectedBorderColor: AppColors.greenColor,
        selectedDotColor: AppColors.greenColor,
        dotColor: AppColors.greenColor.withAlpha(30),
        borderColor: AppColors.greenColor,

        itemCount: _items.length,
        currentPageNotifier: _currentPageNotifier,
      ),
    );
  }

  _buildCircleIndicator3() {
    return CirclePageIndicator(
      selectedDotColor: Colors.green,
      itemCount: _items.length,
      currentPageNotifier: _currentPageNotifier,
    );
  }

  _buildCircleIndicator4() {
    return CirclePageIndicator(
      dotColor: Colors.red,
      itemCount: _items.length,
      currentPageNotifier: _currentPageNotifier,
    );
  }

  _buildCircleIndicator5() {
    return CirclePageIndicator(
      dotColor: Colors.black,
      selectedDotColor: Colors.blue,
      itemCount: _items.length,
      currentPageNotifier: _currentPageNotifier,
    );
  }

  _buildCircleIndicator6() {
    return CirclePageIndicator(
      dotSpacing: 30.0,
      itemCount: _items.length,
      currentPageNotifier: _currentPageNotifier,
    );
  }

  _buildCircleIndicator7() {
    return CirclePageIndicator(
      size: 50.0,
      selectedSize: 75.0,
      itemCount: _items.length,
      currentPageNotifier: _currentPageNotifier,
    );
  }

  _buildCircleIndicator8() {
    return CirclePageIndicator(
      size: 16.0,
      selectedSize: 16.0,
      itemCount: _items.length,
      currentPageNotifier: _currentPageNotifier,
      borderWidth: 5,
      selectedDotColor: Colors.black,
      selectedBorderColor: Colors.red,
      dotColor: Colors.black,
      borderColor: Colors.green,
    );
  }
}

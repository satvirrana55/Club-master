import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sportapp/controller/academy_controllers/login_controller.dart';
import 'package:sportapp/controller/academy_controllers/verify_otp_controller.dart';
import 'package:sportapp/screens/authentication/otp_veriication/OtpVerificationScreen.dart';
import 'package:sportapp/screens/selection_screen/SelectionScreen.dart';
import 'package:sportapp/screens/authentication/sign_up/SignUpScreen.dart';
import 'package:sportapp/helper/strings.dart';

import '../../../helper/colors.dart';
import '../../../utils/constants/text_styles.dart';

class LoginScreen extends StatefulWidget {
  final int? currentIndex;
  const LoginScreen({Key? key, this.currentIndex}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('91');
  TextEditingController mobile = TextEditingController();

  final LoginController loginController = Get.isRegistered<LoginController>()
      ? Get.find<LoginController>()
      : Get.put(LoginController());
  final VerifyOtpController verifyOtpController =
      Get.isRegistered<VerifyOtpController>()
          ? Get.find<VerifyOtpController>()
          : Get.put(VerifyOtpController());

  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(
            primaryColor: AppColors.blue,
          ),
          child: CountryPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: AppColors.blue,
            searchInputDecoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
            isSearchable: true,
            title: Text(
              'SELECT YOUR COUNTRY',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            onValuePicked: (Country country) {
              setState(() {
                _selectedDialogCountry = country;
              });
            },
            priorityList: [
              CountryPickerUtils.getCountryByIsoCode('IN'),
              CountryPickerUtils.getCountryByIsoCode('US'),
              CountryPickerUtils.getCountryByIsoCode('PK'),
              CountryPickerUtils.getCountryByIsoCode('BD'),
              CountryPickerUtils.getCountryByIsoCode('NP'),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/loginUperLogo.png",
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        top: 64,
                        left: 5,
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back_outlined)))
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text("Login",
                        style: AppTextStyles.textSize18WithWeight600Black),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text("Enter Your Mobile Number",
                        style: AppTextStyles.textSize14WithWeight400Black),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    cursorColor: AppColors.blue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.borderColor, width: 1)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.borderColor, width: 1)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.borderColor, width: 1)),
                      prefixIcon: Container(
                        width: 120.0,
                        child: IconButton(
                          onPressed: () {
                            _openCountryPickerDialog();
                          },
                          icon: Container(
                            child: Row(
                              children: <Widget>[
                                CountryPickerUtils.getDefaultFlagImage(
                                    _selectedDialogCountry),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  "+${_selectedDialogCountry.phoneCode}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_down_outlined),
                                Container(
                                    padding: EdgeInsets.only(left: 7, right: 0),
                                    height: 30,
                                    child:
                                        VerticalDivider(width: 1, thickness: 1))
                              ],
                            ),
                          ),
                        ),
                      ),
                      labelText: "Mobile Number",
                    ),
                    controller: mobile,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Phone is required";
                      } else if (value!.trim().length < 2) {
                        return "Phone is too short.";
                      }
                      return null;
                    },
                    // onSaved: (input) => addressTitle = input.trim(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  child: TextButton(
                    onPressed: () async {
                      Get.to(() => OtpVerification(
                            currentIndex: widget.currentIndex,
                          ));
                      /* loginController.phoneNumber = mobile.text;
                      await loginController.login(phoneNumber: mobile.text);
                      if (loginController.status == true) {
                        verifyOtpController.phoneNumber = mobile.text;
                        toast('${loginController.message}');
                        Get.to(() => OtpVerification(
                              currentIndex: widget.currentIndex,
                            ));
                      } else {
                        toast('${loginController.message}');
                      } */
                    },
                    style: TextButton.styleFrom(
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
                      "Login",
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: AppStrings.dontHaveAnAccount + " ",
                      style: AppTextStyles.textSize16WithWeight500Black,
                      children: <TextSpan>[
                        TextSpan(
                          text: AppStrings.createAccount,
                          style: AppTextStyles.textSize16WithWeight500Black
                              .copyWith(
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(() => SignUpScreen(
                                  currentIndex: widget.currentIndex,
                                )),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: RichText(
                      text: TextSpan(
                        text: AppStrings.byContinuingYouAgreeToOur + " ",
                        style: AppTextStyles.textSize16WithWeight500Black,
                        children: <TextSpan>[
                          TextSpan(
                            text: AppStrings.termsAndCondition + " ",
                            style: AppTextStyles.textSize14WithWeight400Grey
                                .copyWith(
                              color: AppColors.greenColor,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => print('click'),
                          ),
                          TextSpan(
                            text: AppStrings.and + " ",
                            style: AppTextStyles.textSize14WithWeight400Grey,
                          ),
                          TextSpan(
                            text: AppStrings.privacyPolicy,
                            style: AppTextStyles.textSize14WithWeight400Grey
                                .copyWith(
                              color: AppColors.greenColor,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => print('click'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

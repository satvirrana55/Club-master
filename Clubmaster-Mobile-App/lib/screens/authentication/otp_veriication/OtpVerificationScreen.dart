import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sportapp/controller/academy_controllers/verify_otp_controller.dart';
import 'package:sportapp/screens/academy/academy_registration/AcadmyRegistration.dart';
import 'package:sportapp/screens/coach/coach_registration/coach_registration.dart';
import 'package:sportapp/screens/parents/parents_registrations/parents_registrations.dart';
import 'package:sportapp/screens/student/student_registration/StudentRegistration.dart';
import 'package:sportapp/utils/constants/text_styles.dart';
import '../../../helper/colors.dart';

class OtpVerification extends StatefulWidget {
  final int? currentIndex;
  const OtpVerification({Key? key, this.currentIndex}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;
  TextEditingController otpController = TextEditingController();
  final VerifyOtpController verifyOtpController =
      Get.isRegistered<VerifyOtpController>()
          ? Get.find<VerifyOtpController>()
          : Get.put(VerifyOtpController());
  String? otp;
  @override
  void initState() {
    print(widget.currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 10),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_outlined)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 57),
              child: Text(
                "OTP Verification",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 16),
              child: Row(
                children: [
                  Text(
                    "We’ve sent it on ",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  Text(
                    "+91${verifyOtpController.phoneNumber}",
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 50.r,
                ),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  autoFocus: true,
                  cursorColor: AppColors.blue,
                  enabled: true,
                  keyboardType: TextInputType.number,
                  textStyle: AppTextStyles.textSize14WithWeight400Grey,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderWidth: 1.0,
                    disabledColor: AppColors.white,
                    errorBorderColor: AppColors.red,
                    activeColor: AppColors.borderColor,
                    inactiveFillColor: AppColors.white,
                    selectedFillColor: AppColors.white,
                    borderRadius: BorderRadius.circular(4),
                    fieldHeight: 45,
                    fieldWidth: 45,
                    inactiveColor: AppColors.borderColor,
                    selectedColor: AppColors.borderColor,
                    activeFillColor: AppColors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: AppColors.white,
                  enableActiveFill: true,
                  //errorTextMargin: EdgeInsets.only(top: 10,),
                  //errorTextSpace: 10,
                  errorAnimationController: errorController,
                  controller: otpController,
                  // validator: (value) {
                  //   if (value?.isEmpty ?? true) {
                  //     return "OTP is require";
                  //   } else if (value!.trim().length < 4) {
                  //     return "Invalid OTP";
                  //   }
                  //   return null;
                  // },
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(
                      () {
                        otp = value;
                        log('respose$value');
                      },
                    );
                  },

                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                child: TextButton(
                  onPressed: () async {
                    log('respose${widget.currentIndex}');
                    if (widget.currentIndex == 1) {
                      await verifyOtpController.verifyOtp(otp: otp);
                      if (verifyOtpController.status == true) {
                        Get.to(() => StudentRegistration());
                        toast('${verifyOtpController.message}');
                      } else {
                        toast('${verifyOtpController.message}');
                      }
                    } else if (widget.currentIndex == 2) {
                      Get.to(() => CoachRegistraion());

                      /* await verifyOtpController.verifyOtp(otp: otp);
                      if (verifyOtpController.status == true) {
                        Get.to(() => CoachRegistraion());
                        toast('${verifyOtpController.message}');
                      } else {
                        toast('${verifyOtpController.message}');
                      } */
                    } else if (widget.currentIndex == 3) {
                      await verifyOtpController.verifyOtp(otp: otp);
                      if (verifyOtpController.status == true) {
                        toast('${verifyOtpController.message}');
                        Get.to(() => AcadmyRegistration(
                            // list: verifyOtpController.stateListData,
                            ));
                      } else {
                        toast('${verifyOtpController.message}');
                      }
                    } else if (widget.currentIndex == 4) {
                      Get.to(() => PerentsRegistraion(
                          // list: verifyOtpController.stateListData,
                          ));
                      /*  await verifyOtpController.verifyOtp(otp: otp);
                      if (verifyOtpController.status == true) {
                        toast('${verifyOtpController.message}');
                        Get.to(() => ParentsRegistration(
                            // list: verifyOtpController.stateListData,
                            ));
                      } else {
                        toast('${verifyOtpController.message}');
                      } */
                    }
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
                    "Verify",
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  log('EEEEEEEEEEE${widget.currentIndex}');
                },
                child: Text(
                  "Resend OTP",
                  style: GoogleFonts.poppins(
                      color: AppColors.greenColor, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

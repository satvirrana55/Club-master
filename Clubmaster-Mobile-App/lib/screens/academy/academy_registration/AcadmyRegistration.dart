import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sportapp/controller/academy_controllers/verify_otp_controller.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/screens/academy/components/common_button.dart';
import 'package:sportapp/screens/academy/dashboard/bottom_navigation_bar.dart';
import 'package:sportapp/utils/constants/text_styles.dart';
import 'package:sportapp/controller/multi_select_dropdown_controller.dart';

import '../../../helper/strings.dart';

class AcadmyRegistration extends StatefulWidget {
  const AcadmyRegistration({Key? key}) : super(key: key);

  @override
  State<AcadmyRegistration> createState() => _AcadmyRegistrationState();
}

class _AcadmyRegistrationState extends State<AcadmyRegistration> {
  final VerifyOtpController verifyOtpController =
      Get.isRegistered<VerifyOtpController>()
          ? Get.find<VerifyOtpController>()
          : Get.put(VerifyOtpController());
  final SelectDropDownControler selectDropDownControler =
      Get.isRegistered<SelectDropDownControler>()
          ? Get.find<SelectDropDownControler>()
          : Get.put(SelectDropDownControler());
  String? selectedSport;
  String? selectedState;
  String? selectedCity;
  var index;
  bool _value = false;
  final List<String> countries = [
    'Running',
    'Frog jump',
    'Football Dance ',
    'Footwork Exercise',
    'Cool Down',
    'Running',
    'Frog jump',
    'Football Dance ',
    'Footwork Exercise',
    'Cool Down',
    'Running',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: AppColors.black,
            )),
        title: Text(
          "Academy Registration",
          style: TextStyle(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 750,
          child: Column(
            children: [
              Divider(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                            style: AppTextStyles.textSize14WithWeight600Black),
                        SizedBox(
                          height: 27,
                        ),
                        Text("Enter Acadamy Name:",
                            style: AppTextStyles.textSize12WithWeight500Black),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0, right: 0),
                          child: TextFormField(
                            cursorColor: AppColors.blue,
                            decoration: InputDecoration(
                              fillColor: AppColors.textFieldBackgroundColor,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldBackgroundColor,
                                      width: 1)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldBackgroundColor,
                                      width: 1)),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldBackgroundColor,
                                      width: 1)),
                              // prefixIcon: Container(
                              //   // width: 120.0,
                              //     child: Icon(Icons.person_outline_outlined, color: Colors.black26,)
                              // ),
                              //labelText: "Your Name",
                            ),
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Your Name is required";
                              } else if (value!.trim().length < 2) {
                                return "Your Name is too short.";
                              }
                              return null;
                            },
                            // onSaved: (input) => addressTitle = input.trim(),
                          ),
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        Text("Select Sport*",
                            style: AppTextStyles.textSize12WithWeight500Black),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: (() {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  final SelectDropDownControler
                                      selectDropDownControler =
                                      Get.isRegistered<
                                              SelectDropDownControler>()
                                          ? Get.find<SelectDropDownControler>()
                                          : Get.put(SelectDropDownControler());
                                  return SingleChildScrollView(
                                    child: AlertDialog(
                                      content: StatefulBuilder(
                                        builder: (BuildContext context,
                                            StateSetter setState) {
                                          return Column(
                                            children: countries
                                                .map((e) => CheckboxListTile(
                                                      title: Text(e),
                                                      onChanged: (value) {
                                                        log('value $e');

                                                        setState(
                                                          () {
                                                            value!
                                                                ? selectDropDownControler
                                                                    .addItem(e)
                                                                : selectDropDownControler
                                                                    .removeItem(
                                                                        e);
                                                            _value = value;
                                                          },
                                                        );
                                                      },
                                                      value:
                                                          selectDropDownControler
                                                              .isHaveItem(e),
                                                    ))
                                                .toList(),
                                          );
                                        },
                                      ),
                                      actions: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 2, right: 2),
                                          child: InkWell(
                                            onTap: (() {
                                              Navigator.pop(context);
                                            }),
                                            child: CommonButton(
                                              text: 'Submit',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            }),
                            child: Container(
                              height: 65.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: AppColors.textFieldBackgroundColor),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, top: 0, bottom: 0, right: 13),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Select Sport',
                                        style: AppTextStyles
                                            .textSize12WithWeight500Black),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Icon(Icons.keyboard_arrow_down_rounded)
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 27,
                        ),
                        Text("Select State*",
                            style: AppTextStyles.textSize12WithWeight500Black),
                        SizedBox(
                          height: 10,
                        ),
                        FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                fillColor: AppColors.textFieldBackgroundColor,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            AppColors.textFieldBackgroundColor,
                                        width: 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            AppColors.textFieldBackgroundColor,
                                        width: 1)),
                                disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            AppColors.textFieldBackgroundColor,
                                        width: 1)),
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 16.0),
                              ),
                              isEmpty: selectedState == null,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  icon: Icon(Icons.keyboard_arrow_down,
                                      color: AppColors.grey),
                                  value: selectedState,
                                  hint: Text("Select State"),
                                  isDense: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedState = newValue!;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: verifyOtpController.stateListData
                                      .map((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        Text("Enter City",
                            style: AppTextStyles.textSize12WithWeight500Black),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0, right: 0),
                          child: TextFormField(
                            cursorColor: AppColors.blue,
                            decoration: InputDecoration(
                              fillColor: AppColors.textFieldBackgroundColor,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldBackgroundColor,
                                      width: 1)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldBackgroundColor,
                                      width: 1)),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldBackgroundColor,
                                      width: 1)),
                              // prefixIcon: Container(
                              //   // width: 120.0,
                              //     child: Icon(Icons.person_outline_outlined, color: Colors.black26,)
                              // ),
                              //labelText: "Your Name",
                            ),
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Your Name is required";
                              } else if (value!.trim().length < 2) {
                                return "Your Name is too short.";
                              }
                              return null;
                            },
                            // onSaved: (input) => addressTitle = input.trim(),
                          ),
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        Text("Enter Address*",
                            style: AppTextStyles.textSize12WithWeight500Black),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0, right: 0),
                          child: TextFormField(
                            cursorColor: AppColors.blue,
                            decoration: InputDecoration(
                              fillColor: AppColors.textFieldBackgroundColor,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldBackgroundColor,
                                      width: 1)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldBackgroundColor,
                                      width: 1)),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.textFieldBackgroundColor,
                                      width: 1)),
                              // prefixIcon: Container(
                              //   // width: 120.0,
                              //     child: Icon(Icons.person_outline_outlined, color: Colors.black26,)
                              // ),
                              //labelText: "Your Name",
                            ),
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Your Name is required";
                              } else if (value!.trim().length < 2) {
                                return "Your Name is too short.";
                              }
                              return null;
                            },
                            // onSaved: (input) => addressTitle = input.trim(),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 30,
                              child: TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    builder: (BuildContext context) {
                                      return BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 10, sigmaY: 10),
                                        child: Container(
                                          height: 298,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight:
                                                      Radius.circular(25))),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Expanded(child: Container()),
                                                Image.asset(
                                                    "assets/images/successfully.png"),
                                                Expanded(child: Container()),
                                                Text(
                                                  "Registration Successful",
                                                  style: AppTextStyles
                                                      .textSize20WithWeight500Black,
                                                ),
                                                Expanded(child: Container()),
                                                Text(
                                                  "Your registration has been successfully done. You can login to the app post approval from Admin",
                                                  style: AppTextStyles
                                                      .textSize14WithWeight400SubLineTextGreyColor,
                                                  textAlign: TextAlign.center,
                                                ),
                                                Expanded(child: Container()),
                                                AppButton(
                                                  color: AppColors.blue,
                                                  text: AppStrings.ok,
                                                  onTap: () {
                                                    Get.to(() =>
                                                        BottomNavigationBarAcademy());
                                                  },
                                                  textStyle: AppTextStyles
                                                      .textSize16WithWeight600White,
                                                ),
                                                Expanded(child: Container()),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
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
                                  "Submit",
                                  style: GoogleFonts.poppins(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

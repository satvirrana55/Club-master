import 'dart:ui';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sportapp/controller/multi_select_dropdown_controller.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/screens/academy/components/common_button.dart';
import 'package:sportapp/screens/components/search_able_dropdown.dart';
import 'package:sportapp/screens/student/dashboard/bottom_navigation_bar.dart';
import 'package:sportapp/utils/constants/text_styles.dart';

import '../../../helper/strings.dart';

class StudentRegistration extends StatefulWidget {
  const StudentRegistration({Key? key}) : super(key: key);

  @override
  State<StudentRegistration> createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('91');
  TextEditingController mobile = TextEditingController();
  String? selectedSport, selectedAcadmy, selectedCoach;
  final sportList = ["Cricket", "Golf"];
  final academyList = ["Academy 1", "Academy 2"];
  final coachList = ["Coach 1", "Coach 2"];
  List gender = ["Male", "Female", "Other"];
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
    'Frog jump',
    'Football Dance ',
    'Footwork Exercise',
    'Cool Down',
    'Running',
    'Frog jump',
    'Football Dance ',
    'Footwork Exercise',
    'Cool Down',
  ];

  String? select;
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

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio<String>(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              print(value);
              select = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

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
          "Student Registration",
          style: TextStyle(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Provide us little info about you.",
                            style: AppTextStyles.textSize14WithWeight600Black),
                        SizedBox(
                          height: 27,
                        ),
                        Text("Select DOB*",
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
                              prefixIcon: Container(
                                  // width: 120.0,
                                  child: Icon(
                                Icons.calendar_today,
                                color: AppColors.greenColor,
                                size: 25,
                              )),
                              //labelText: "Your Name",
                            ),
                            keyboardType: TextInputType.name,
                            onTap: () async {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());

                              DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: new DateTime.now(),
                                  firstDate: new DateTime(2020),
                                  lastDate: new DateTime(2030));
                              if (picked != null) setState(() {});
                            },
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
                        Text("Username*",
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

                        Text("Select Academy*",
                            style: AppTextStyles.textSize12WithWeight500Black),
                        SizedBox(
                          height: 10,
                        ),
                        SearchAbleDropDown(),

                        SizedBox(
                          height: 27,
                        ),

                        Text("Select Coach*",
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
                              isEmpty: selectedCoach == null,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  icon: Icon(Icons.keyboard_arrow_down,
                                      color: AppColors.grey),
                                  value: selectedCoach,
                                  hint: Text("Select Your Coach"),
                                  isDense: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedCoach = newValue!;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: coachList.map((String value) {
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

                        Text("Select Sport*(Choose upto 3)",
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
                                        style:
                                            Ts.regular18(AppColors.grey494F59)),
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

                        Text("Enter Your Mobile Number :",
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
                                      color: AppColors.borderColor, width: 0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.borderColor, width: 0)),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.borderColor, width: 0)),
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
                                        Icon(
                                            Icons.keyboard_arrow_down_outlined),
                                        Container(
                                            padding: EdgeInsets.only(
                                                left: 7, right: 0),
                                            height: 30,
                                            child: VerticalDivider(
                                                width: 1, thickness: 1))
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
                          height: 27,
                        ),

                        Text("Select Gender",
                            style: AppTextStyles.textSize12WithWeight500Black),

                        // SizedBox(height: 10,),

                        Row(
                          children: [
                            addRadioButton(1, "Male"),
                            addRadioButton(0, "Female"),
                          ],
                        ),
                        SizedBox(
                          height: 27,
                        ),

                        Container(
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
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(25))),
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
                                                    BottomNavigationBarStudent());
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sportapp/controller/multi_select_dropdown_controller.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/screens/academy/components/common_button.dart';
import 'package:sportapp/screens/coach/components/text_form_field.dart';
import 'package:sportapp/screens/coach/dashboard/bottom_navigation_bar.dart';
import 'package:sportapp/screens/coach/dashboard/home.dart';
import 'package:sportapp/screens/components/appbar.dart';
import 'package:sportapp/screens/components/search_able_dropdown.dart';

class CoachRegistraion extends StatefulWidget {
  const CoachRegistraion({super.key});

  @override
  State<CoachRegistraion> createState() => _CoachRegistraionState();
}

class _CoachRegistraionState extends State<CoachRegistraion> {
  TextEditingController expYear = TextEditingController();

  String? gender;
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
  bool? _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.h),
          child: CommonAppBar(
            tittle: 'Coach Registration',
            color: Colors.black,
            backColor: AppColors.white,
            elevation: 0.5,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: Ts.medium14(AppColors.black),
              ),
              SizedBox(
                height: 27.h,
              ),
              Text(
                'Select Academy*',
                style: Ts.medium14(AppColors.grey4C4E53),
              ),
              SizedBox(
                height: 12.h,
              ),
              SearchAbleDropDown(),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Select Sport*',
                style: Ts.medium14(AppColors.grey4C4E53),
              ),
              SizedBox(
                height: 12.h,
              ),
              InkWell(
                  onTap: (() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        final SelectDropDownControler selectDropDownControler =
                            Get.isRegistered<SelectDropDownControler>()
                                ? Get.find<SelectDropDownControler>()
                                : Get.put(SelectDropDownControler());
                        return SingleChildScrollView(
                          child: AlertDialog(
                            content: StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
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
                                                          .removeItem(e);
                                                  _value = value;
                                                },
                                              );
                                            },
                                            value: selectDropDownControler
                                                .isHaveItem(e),
                                          ))
                                      .toList(),
                                );
                              },
                            ),
                            actions: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 2, right: 2),
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
                    height: 59.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.textFieldBackgroundColor),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, top: 0, bottom: 0, right: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Select Sport',
                            style: Ts.regular14(AppColors.grey494F59),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Icon(Icons.arrow_drop_down_sharp)
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Experience in years*',
                style: Ts.medium14(AppColors.grey4C4E53),
              ),
              SizedBox(
                height: 12.h,
              ),
              TextFromFieldSeleted(
                textEditingController: expYear,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Select Gender*',
                style: Ts.medium14(AppColors.grey4C4E53),
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  Radio<String>(
                    activeColor: AppColors.greenColor,
                    value: 'male',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        print(value);
                        gender = value;
                      });
                    },
                  ),
                  Text(
                    'Male',
                    style: Ts.medium14(AppColors.grey4C4E53),
                  ),
                  Radio<String>(
                    activeColor: AppColors.greenColor,
                    value: 'Female',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        print(value);
                        gender = value;
                      });
                    },
                  ),
                  Text(
                    'Female',
                    style: Ts.medium14(AppColors.grey4C4E53),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 52.h),
        child: BottomAppBar(
          elevation: 0,
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      icon: Image.asset(
                        "assets/images/successfully.png",
                        height: 90.h,
                      ),
                      title: Text(
                        "Registration completed",
                        style: Ts.medium20(AppColors.black121213),
                      ),
                      content: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Your registration has been successfully done. You can login to the app post approval from Admin',
                          style: Ts.regular14(AppColors.grey4C4E53),
                        ),
                      ),
                      actions: [
                        InkWell(
                          onTap: (() {
                            Get.to(() => BottomNavigationBarCoach());
                          }),
                          child: CommonButton(
                            text: 'Ok',
                          ),
                        ),
                      ],
                    );
                  });
            },
            child: CommonButton(
              text: 'Submit',
            ),
          ),
        ),
      ),
    );
  }
}

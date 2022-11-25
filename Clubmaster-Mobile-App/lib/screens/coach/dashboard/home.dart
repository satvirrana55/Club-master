import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/screens/coach/assess_of_student/coach_assess_of_student.dart';
import 'package:sportapp/screens/coach/create_tournament/create_tournament.dart';
import 'package:sportapp/screens/coach/lesson_and_plan/lesson_and_plan.dart';

class CoachHomeScreen extends StatefulWidget {
  const CoachHomeScreen({Key? key}) : super(key: key);

  @override
  State<CoachHomeScreen> createState() => _CoachHomeScreenState();
}

class _CoachHomeScreenState extends State<CoachHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 245,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.greenColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    "Welcome!\nRahul Vaidya",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                // traningimg.png
                // tournamentImg.png
                // assesImg.png
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Image.asset(
              "assets/images/dummy2.png",
              width: MediaQuery.of(context).size.width - 40,
            ),
            SizedBox(
              height: 15,
            ),
            Image.asset(
              "assets/images/dummy1.png",
              width: MediaQuery.of(context).size.width - 40,
            ),
          ],
        ),
        Positioned(
          top: 180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (() {
                  Get.to(() => CoachLessonPlan());
                }),
                child: Image.asset(
                  "assets/images/traningimg.png",
                  width: MediaQuery.of(context).size.width / 3 - 13,
                ),
              ),
              InkWell(
                onTap: (() {
                  Get.to(() => CoachCreateTourament());
                }),
                child: Image.asset(
                  "assets/images/tournamentImg.png",
                  width: MediaQuery.of(context).size.width / 3 - 13,
                ),
              ),
              InkWell(
                onTap: (() {
                  Get.to(() => CoachAssessofStudents());
                }),
                child: Image.asset(
                  "assets/images/assesImg.png",
                  width: MediaQuery.of(context).size.width / 3 - 13,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

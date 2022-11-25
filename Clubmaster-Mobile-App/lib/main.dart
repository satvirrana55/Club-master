import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sportapp/screens/bindings.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/screens/onboarding/onboarding_screen.dart';
import 'package:sportapp/screens/splash_screen.dart';
import 'package:sportapp/utils/constants/text_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Funday',
          initialBinding: MyBindings(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            // dividerColor: AppColors.dividerColor,
            appBarTheme: AppBarTheme(
              elevation: 0,
              backgroundColor: AppColors.white,
              // titleTextStyle: textSize18With500WeightBlack,
            ),
            inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: AppColors.blue,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: AppColors.blue,
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              labelStyle: AppTextStyles.textSize14WithWeight400Grey,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: AppColors.blue,
                  width: 1,
                ),
              ),
              fillColor: AppColors.white,
              errorStyle: TextStyle(
                fontSize: 14,
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                primary: AppColors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                ),
              ),
            ),
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}

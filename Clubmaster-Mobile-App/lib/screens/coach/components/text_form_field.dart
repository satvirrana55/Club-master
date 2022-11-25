import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/screens/onboarding/onboarding_screen.dart';

class TextFromFieldSeleted extends StatefulWidget {
  final TextEditingController? textEditingController;
  const TextFromFieldSeleted({super.key, this.textEditingController});

  @override
  State<TextFromFieldSeleted> createState() => _TextFromFieldSeletedState();
}

class _TextFromFieldSeletedState extends State<TextFromFieldSeleted> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.textEditingController,
        decoration: InputDecoration(
          fillColor: AppColors.textFieldBackgroundColor,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.textFieldBackgroundColor, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.textFieldBackgroundColor, width: 1)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.textFieldBackgroundColor, width: 1)),
        ),
        keyboardType: TextInputType.name,
        validator: (value) {},
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/images.dart';
import 'package:sportapp/helper/ts.dart';

class ProfileTextField extends StatefulWidget {
  final int? value;
  final String? lable;
  final Widget? ImageIcon;

  final TextEditingController? textEditingController;
  const ProfileTextField(
      {Key? key,
      this.textEditingController,
      this.value,
      this.lable,
      this.ImageIcon})
      : super(key: key);
  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.textFieldBackgroundColor,
      child: TextFormField(
        maxLines: widget.value,
        controller: widget.textEditingController,
        style: Ts.regular16(AppColors.black),
        decoration: InputDecoration(
            icon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: widget.ImageIcon,
            ),
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
            label: Text(widget.lable ?? '')),
      ),
    );
  }
}

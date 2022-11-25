import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/ts.dart';

class CreateTextField extends StatefulWidget {
  final int? value;
  final String? lable;

  final TextEditingController? textEditingController;
  const CreateTextField(
      {Key? key, this.textEditingController, this.value, this.lable})
      : super(key: key);
  @override
  State<CreateTextField> createState() => _CreateTextFieldState();
}

class _CreateTextFieldState extends State<CreateTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        maxLines: widget.value,
        controller: widget.textEditingController,
        style: Ts.regular16(AppColors.black),
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
            label: Text(widget.lable ?? '')),
      ),
    );
  }
}

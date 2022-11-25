import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sportapp/helper/colors.dart';

class SelectDropDown extends StatefulWidget {
  final String? selectedValue;
  final item;
  const SelectDropDown({super.key, this.selectedValue, this.item});

  @override
  State<SelectDropDown> createState() => _SelectDropDownState();
}

class _SelectDropDownState extends State<SelectDropDown> {
  String? selectedValue;
  var items = ["item1", "it"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
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
              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
            ),
            isEmpty: selectedValue == null,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Icon(Icons.keyboard_arrow_down, color: AppColors.grey),
                value: selectedValue,
                hint: Text("Select State"),
                isDense: true,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                    state.didChange(newValue);
                  });
                },
                items: items.map((value) {
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
    );
  }
}

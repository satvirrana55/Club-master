import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/ts.dart';

class CreateDropdown extends StatefulWidget {
  const CreateDropdown({super.key});

  @override
  State<CreateDropdown> createState() => _CreateDropdownState();
}

class _CreateDropdownState extends State<CreateDropdown> {
  String dropdownvalue = 'Running';

  var items = [
    'Running',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.textFieldBackgroundColor,
          border:
              Border.all(color: AppColors.textFieldBackgroundColor, width: .5),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: DropdownButton(
          focusColor: Colors.transparent,
          elevation: 0,
          style: Ts.regular16(AppColors.black),
          isDense: true,
          isExpanded: true,
          value: dropdownvalue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
            });
          },
        ),
      ),
    );
  }
}

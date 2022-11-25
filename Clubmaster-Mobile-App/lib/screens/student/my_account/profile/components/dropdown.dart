import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/helper/ts.dart';
import 'package:sportapp/module/get_state_list_module.dart';

class ProfileDropdown extends StatefulWidget {
  final List<StateListModule>? statListModule;
  final String? dropdownvalue;
  final Function? function;

  const ProfileDropdown({
    super.key,
    this.statListModule,
    this.dropdownvalue,
    this.function,
  });

  @override
  State<ProfileDropdown> createState() => _ProfileDropdownState();
}

class _ProfileDropdownState extends State<ProfileDropdown> {
  String? dropdownvalue = 'Select';

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
          icon: const Icon(Icons.keyboard_arrow_down),
          hint: Text('${dropdownvalue}'),
          items: widget.statListModule!.map((StateListModule items) {
            return DropdownMenuItem<String>(
              value: items.name,
              child: Text(
                '${items.name}',
                style: Ts.regular16(AppColors.black),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              dropdownvalue = newValue as String;
            });
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportapp/helper/colors.dart';
import 'package:sportapp/screens/academy/components/common_button.dart';

class MultiSelected extends StatefulWidget {
  const MultiSelected({super.key});

  @override
  State<MultiSelected> createState() => _MultiSelectedState();
}

class _MultiSelectedState extends State<MultiSelected> {
  final List<String> countries = [
    'United Kingdom',
    'USA',
    'France',
    'Australia',
    'New Zealand',
    'Germany',
    'Vietnam',
    'India'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DropdownSearch<String>.multiSelection(
            autoValidateMode: AutovalidateMode.always,
            items: [
              "Running",
              "Footbal",
              "Circket",
            ],
            popupProps: PopupPropsMultiSelection.dialog(
                favoriteItemProps: FavoriteItemProps(),
                listViewProps: ListViewProps(),
                dialogProps: DialogProps(
                    alignment: Alignment.center,
                    actionsAlignment: MainAxisAlignment.center,
                    clipBehavior: Clip.hardEdge,
                    backgroundColor: AppColors.white,
                    semanticLabel: "Vlaue",
                    useRootNavigator: false,
                    elevation: 100,
                    anchorPoint: Offset(0, 0),
                    barrierDismissible: true,
                    actionsOverflowButtonSpacing: 0,
                    buttonPadding: EdgeInsets.only(left: 1000),
                    actions: [],
                    shape: Border())),
            dropdownButtonProps: DropdownButtonProps(
              color: AppColors.black,
            ),
            onChanged: ((value) {}),
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: TextStyle(color: AppColors.black),
              dropdownSearchDecoration: InputDecoration(
                fillColor: AppColors.textFieldBackgroundColor,
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.transparent)),
                suffixIconConstraints: BoxConstraints(
                  minHeight: 32.h,
                  minWidth: 32.w,
                ),
                suffixIconColor: Colors.grey,
                labelText: "Select",
                hintText: "Search for academy",
              ),
            ),
          )
        ],
      ),
    );
  }
}

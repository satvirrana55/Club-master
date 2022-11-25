import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sportapp/helper/colors.dart';

class SearchAbleDropDown extends StatefulWidget {
  const SearchAbleDropDown({super.key});

  @override
  State<SearchAbleDropDown> createState() => _SearchAbleDropDownState();
}

class _SearchAbleDropDownState extends State<SearchAbleDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: DropdownSearch<String>(
              popupProps: PopupProps.dialog(
                  interceptCallBacks: true, //important line
                  showSelectedItems: false,
                  listViewProps: ListViewProps(),
                  fit: FlexFit.loose,
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                    /* suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {},
                      ), */
                    label: Text('Search for academy'),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusColor: AppColors.greenColor,
                    prefixIcon: Icon(Icons.search),
                  ))),
              items: [
                "Academy 1",
                "Academy 2",
                "Academy 3",
                'Academy 4',
                "Academy 1",
                "Academy 2",
                "Academy 3",
                'Academy 4',
                "Academy 1",
                "Academy 2",
                "Academy 3",
                'Academy 4',
                'Academy 5'
              ],
              dropdownButtonProps: DropdownButtonProps(
                  icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColors.grey,
              )),
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
              onChanged: (value) {
                log(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}

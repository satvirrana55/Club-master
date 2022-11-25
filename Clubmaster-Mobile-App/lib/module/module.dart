/* 
import 'package:Field_Force/constants.dart';
import 'package:Field_Force/screens/MRBD/Components/Modules/meter_status_dropdown_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeterStatusDropDownField extends StatefulWidget {
  final Function onSelectValue;
  final Function? onSelectValue1;

  final String dropDownName;
  final String? reasonName;
  final MeterStatusModuleClass? meterStatusDropDown;
  final re;

  const MeterStatusDropDownField(/*  */
      {required this.onSelectValue,
      required this.dropDownName,
      required this.meterStatusDropDown,
      this.re,
      this.reasonName,
      this.onSelectValue1});
  @override
  _MeterStatusDropDownFieldState createState() =>
      _MeterStatusDropDownFieldState();
}

class _MeterStatusDropDownFieldState extends State<MeterStatusDropDownField> {
  String? selectedRegion;
  String? meterSatus;

  List dropDownMeterStatusList = [];
  Result? data1;
  late var item;
  Color color = Colors.black54;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: SizedBox(
        child: DropdownButtonHideUnderline(
          child: Column(children: [
            Container(
                child: DropdownButtonFormField(
              decoration: InputDecoration(labelText: widget.dropDownName),
              iconSize: 25,
              style: TextStyle(color: Colors.black, fontSize: 13),

              //  hint: Text(widget.dropDownName),
              //value: selectedRegion,
              validator: (dynamic value) {
                if (value == null) {
                  _showDialog(METER_STATUS_REQURIED, METER_STATUS_REQURIED_DIC);
                  return METER_STATUS_REQURIED;
                } else {
                  return null;
                }
              },
              items: widget.meterStatusDropDown!.result!.map((Result result) {
                return new DropdownMenuItem<String>(
                    value: result.meterStatusName,
                    onTap: () {
                      //  return result.meterStatusName.toString();
                    },
                    child: Text(
                      result.meterStatusName!,
                      style: TextStyle(
                          color: color,
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ));
              }).toList(),
              onChanged: (dynamic value) {
                FocusScope.of(context).requestFocus(FocusNode());
                item = widget.meterStatusDropDown!.result!
                    .where((element) => element.meterStatusName == value)
                    .first;
                var drop;
                var i;
                List<String?> normal = [];
                List<String?> faulty = [];
                List<String?> rcnt = [];
                for (i = 0;
                    i <
                        widget.meterStatusDropDown!.result![0].readerStatusList!
                            .length;
                    i++) {
                  drop = widget.meterStatusDropDown!.result![0]
                      .readerStatusList![i].readerStatusName;

                  normal.add(drop);
                }
                for (i = 0;
                    i <
                        widget.meterStatusDropDown!.result![1].readerStatusList!
                            .length;
                    i++) {
                  drop = widget.meterStatusDropDown!.result![1]
                      .readerStatusList![i].readerStatusName;

                  faulty.add(drop);
                }
                for (i = 0;
                    i <
                        widget.meterStatusDropDown!.result![2].readerStatusList!
                            .length;
                    i++) {
                  drop = widget.meterStatusDropDown!.result![2]
                      .readerStatusList![i].readerStatusName;

                  rcnt.add(drop);
                }

                /*  List text111 = [
                  widget.meterStatusDropDown.result[2].readerStatusList[0]
                      .readerStatusName
                ]; */

                if (value == "Normal") {
                  dropDownMeterStatusList = normal;
                } else if (value == "Faulty") {
                  dropDownMeterStatusList = faulty;
                } else if (value == "RCNT") {
                  dropDownMeterStatusList = rcnt;
                }

                widget.onSelectValue(
                    item.meterStatusName,
                    item.meterStatusIdString,
                    item.readerStatusList[0].readerStatusIdString,
                    item.readerStatusList[0].readerStatusName,
                    item.readerStatusList[0].readerStatusName);
                setState(() {
                  selectedRegion = null;
                });
              },

              //  onSaved: onChangedCallback,
            )),
            Container(
              child: DropdownButtonFormField(
                validator: (dynamic value) {
                  if (value == null) {
                    _showDialog(
                        RESION_CODE_REQURIED, RESION_CODE_REQURIED_STATUS);
                    return RESION_CODE_REQURIED;
                  } else {
                    return null;
                  }
                },

                decoration: InputDecoration(labelText: widget.reasonName),
                iconSize: 25,
                style: TextStyle(
                    color: color, fontSize: 13, fontWeight: FontWeight.bold),
                onChanged: (dynamic s) {
                  setState(() {
                    selectedRegion = null;
                    selectedRegion = s;
                  });
                  widget.onSelectValue1!(s);
                },
                // hint: Text(widget.reasonName),
                value: selectedRegion,
                items: dropDownMeterStatusList.map((e) {
                  return new DropdownMenuItem(value: e, child: Text('$e'));
                }).toList(),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  _showDialog(title, text) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("$title"),
            content: Text(
              text,
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
}
 */
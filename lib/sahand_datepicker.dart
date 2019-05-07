import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahand_datepicker_plugin/dialog/CustomAlertDialog.dart';
import 'package:sahand_datepicker_plugin/dialog/picker_master.dart';
import 'package:sahand_datepicker_plugin/resources/customcolors.dart';

class SahandDatePicker {
  static const MethodChannel _channel =
      const MethodChannel('sahand_datepicker_plugin');
  static StreamController streamController = StreamController.broadcast();

  static bool singleTapSelect;

  static Future<String> pickDate (BuildContext context , {int year = 1330 , int month = 1, int fontSize = 14, int extraHeight = 0 , Color borderColor, Color color1 , Color color2 ,Color dateBackColor,bool singleTapSelect = false}) async {
    if (borderColor != null)
      CustomColors.borderColor = borderColor;
    if (color1 != null)
      CustomColors.color1 = color1;
    if (color2 != null)
      CustomColors.color2 = color2;
    if (dateBackColor != null)
      CustomColors.dateBackColor = dateBackColor;
    SahandDatePicker.singleTapSelect = singleTapSelect;

    String pickedDate = "";
    streamController.stream.listen((data) {
      pickedDate = data;
    });
    await showDialog(
        context: context,
        builder: (BuildContext context) {
      return CustomAlertDialog(
        contentPadding: EdgeInsets.all(0),
        content:
        Container(
          decoration: BoxDecoration(color: CustomColors.borderColor,borderRadius: BorderRadius.all(Radius.circular(5))),
          child:
        Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
          width: 300,
          height: 400 + extraHeight.toDouble(),
          margin: EdgeInsets.all(2),
          child: PickerMaster(month: month , year: year,fontSize: fontSize,extraHeight: extraHeight,),
        ),),

      );
    });

    return pickedDate;
  }
}

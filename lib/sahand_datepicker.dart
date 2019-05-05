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


  static Future<String> pickDate (BuildContext context , int year , int month) async {
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
          height: 400,
          margin: EdgeInsets.all(2),
          child: PickerMaster(month: month , year: year,),
        ),),

      );
    });

    return pickedDate;
  }
}

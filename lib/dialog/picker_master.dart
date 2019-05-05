import 'package:flutter/material.dart';
import 'package:sahand_datepicker_plugin/dialog/CustomButton.dart';
import 'package:sahand_datepicker_plugin/dialog/monthOrganizer.dart';
import 'package:sahand_datepicker_plugin/dialog/monthWidget.dart';

class PickerMaster extends StatefulWidget  {

  int year;
  int month;
  PickerMaster({this.year, this.month});

  createState() => PickerMasterState();

}

class PickerMasterState extends State<PickerMaster> {


  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(child: Text("انتخاب تاریخ"),margin: EdgeInsets.only(top: 10,bottom: 10),),
      monthOrganizer(month: widget.month , year: widget.year,),
      CustomRaisedButtom(width: 200,padding: EdgeInsets.all(8),margin: EdgeInsets.all(10),child: Text("تایید",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),onTap: () {
        Navigator.of(context).pop();
      },)
    ],);
  }
}

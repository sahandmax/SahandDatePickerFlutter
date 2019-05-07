import 'package:flutter/material.dart';
import 'package:sahand_datepicker_plugin/resources/customcolors.dart';

class DayItem extends StatefulWidget {
  createState() => DateItemState();
  bool isSelected;
  String dayNo;
  bool empty;
  int fontSize;

  DayItem(this.fontSize,{this.isSelected, this.dayNo, this.empty});
}

class DateItemState extends State<DayItem> {



  @override
  Widget build(BuildContext context) {
    if (widget.empty == null)
      widget.empty = false;
    if (widget.isSelected == null)
      widget.isSelected = false;
    if (widget.dayNo == null)
      widget.dayNo = "";
    // TODO: implement build
    return widget.empty? Container() :
      Container(
      
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: widget.isSelected
            ? LinearGradient(
                colors: [CustomColors.color1, CustomColors.color2],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)
            : LinearGradient(colors: [
                CustomColors.dateBackColor,
                CustomColors.dateBackColor
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Container(
         decoration: BoxDecoration(color: CustomColors.dateBackColor,
             borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.all(2),
        child: Center(child: Text(widget.dayNo,style: TextStyle(fontSize: widget.fontSize.toDouble()),)),
      ),
    );
  }
}

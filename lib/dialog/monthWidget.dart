import 'package:flutter/material.dart';
import 'package:sahand_datepicker_plugin/dialog/dayItem.dart';
import 'package:persian_date/persian_date.dart';
import 'package:sahand_datepicker_plugin/sahand_datepicker.dart';


class monthWidget extends StatefulWidget {
  String monthName;
  int month;
  int year;
  int fontSize;


  monthWidget({this.monthName , this.month , this.year,this.fontSize});

  createState() => monthWidgetState();
}

class monthWidgetState extends State<monthWidget> {
  List<Widget> dayItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PersianDate persianDate = PersianDate();
    String monthString = widget.month.toString();
    monthString = monthString.length == 1 ? "0"+monthString : monthString;
    DateTime dateTime = persianDate.jalaliToGregorian(widget.year.toString() + "-" + monthString + "-01 00:00");

    int firstWeekDay = dateTime.weekday + 2;
    if (firstWeekDay > 7 )
      firstWeekDay = firstWeekDay - 7;

    for (int i = 1 ; i <= 40 ; i++) {
      if(widget.month > 6) {
        if ((i - firstWeekDay + 1) > 30)
          continue;
      }
      if ((i - firstWeekDay + 1) > 31)
        continue;
        if (i< firstWeekDay)
        dayItems.add(DayItem(widget.fontSize,empty: true,));
        else
        dayItems.add(DayItem(widget.fontSize,dayNo: (i - firstWeekDay + 1).toString(),isSelected: false,empty: false,));
    }

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    TextStyle weekDayTextStyle = TextStyle(fontSize: widget.fontSize.toDouble());

   return Container(
      width: 300,
      child:
      Column(children: [
        Text(widget.monthName,style: weekDayTextStyle,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Container(width: 240,height: 250,child:
        GridView.builder(
          gridDelegate:

          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7,crossAxisSpacing: 0.1,mainAxisSpacing: 0.1,childAspectRatio: 0.90),

          itemBuilder: (BuildContext context , int index) {

            return  GestureDetector(onTap: () {
              setState(() {
              int position = 0;

              for (DayItem dayItem in dayItems) {
                if (dayItem.empty){
                  position++;
                  continue;
                }
                dayItem.isSelected = false;
                dayItems[position] = DayItem(widget.fontSize,dayNo: dayItem.dayNo,isSelected: false,empty: false,);
                position++;
              }
              DayItem dayItem = dayItems[index];
//              dayItem.isSelected = true;
                if (dayItem.empty)
                  return;
                dayItems[index] = DayItem(widget.fontSize,dayNo: dayItem.dayNo,isSelected: true,empty: false,);
                SahandDatePicker.streamController.sink.add(widget.year.toString() +"/" + widget.month.toString()+ "/" + dayItem.dayNo.toString());
              });
            },child: dayItems[index]);
          },

          scrollDirection: Axis.horizontal,
          reverse: true,

          itemCount: dayItems.length,)),

     Container(

       width: 60,height: 260,child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[

          Text("شنبه",style: weekDayTextStyle,),
          Text("یکشنبه",style: weekDayTextStyle,),
          Text("دوشنبه",style: weekDayTextStyle,),
          Text("سه شنبه",style: weekDayTextStyle,),
          Text("چهارشنبه",style: weekDayTextStyle,),
          Text("پنج شنبه",style: weekDayTextStyle,),
          Text("جمعه",style: weekDayTextStyle,),
        ],),)
      ],),],),);


  }

}
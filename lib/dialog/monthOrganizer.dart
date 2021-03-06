import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sahand_datepicker_plugin/dialog/monthWidget.dart';

class monthOrganizer extends StatefulWidget {
  static StreamController monthChanger = StreamController.broadcast();
  int year;
  int month;
  int fontSize;
  int extraHeight;
  monthOrganizer({this.year, this.month,this.fontSize,this.extraHeight});

  createState() => monthOrganizerState();
}

class monthOrganizerState extends State<monthOrganizer> {

  int SelectedMonth = 0;
  int SelectedYear = 0;
  PageController monthPageController;
  PageController yearPageController;

  @override
  void initState() {
    super.initState();
    SelectedYear = (widget.year - 1330);
    SelectedMonth = (widget.month - 1);
    monthOrganizer.monthChanger.stream.listen((data) {
      String command = data;
      if (command == "next") {
//          setState(() {
      if (SelectedMonth < 11) {
        SelectedMonth++;
        monthPageController.jumpToPage(SelectedMonth);
      }
//          });
      }

      if (command == "prev") {
//       setState(() {
      if (SelectedMonth > 0) {
        SelectedMonth--;
        monthPageController.jumpToPage(SelectedMonth);
      }
//       });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    monthPageController = PageController(initialPage: SelectedMonth);
    yearPageController = PageController(initialPage: SelectedYear);

    return Container(
      width: 320,
      height: 287 + widget.extraHeight.toDouble(),
      child: PageView.builder(
        itemBuilder: (BuildContext context, int yearIndex) {
          return Container(
            width: 320,
            height: 287 + widget.extraHeight.toDouble(),
            child: PageView.builder(
              itemBuilder: (BuildContext context, int monthIndex) {
                int year = 1330 + yearIndex;
                int month = monthIndex + 1;
                String monthName;
                switch (month) {
                  case 1:
                    monthName = "فروردین";
                    break;
                  case 2:
                    monthName = "اردیبهشت";
                    break;
                  case 3:
                    monthName = "خرداد";
                    break;
                  case 4:
                    monthName = "تیر";
                    break;
                  case 5:
                    monthName = "مرداد";
                    break;
                  case 6:
                    monthName = "شهریور";
                    break;
                  case 7:
                    monthName = "مهر";
                    break;
                  case 8:
                    monthName = "آبان";
                    break;
                  case 9:
                    monthName = "آذر";
                    break;
                  case 10:
                    monthName = "دی";
                    break;
                  case 11:
                    monthName = "بهمن";
                    break;
                  case 12:
                    monthName = "اسفند";
                    break;
                }
                return monthWidget(
                  monthName: year.toString() + " " + monthName + " ماه",
                  month: month,
                  year: year,
                  fontSize: widget.fontSize,

                );
              },
              itemCount: 12,
              reverse: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (selected) {
                setState(() {
                  SelectedMonth = selected;
                });
              },
              controller: monthPageController,
            ),
          );
        },
        itemCount: 200,
        scrollDirection: Axis.vertical,
        onPageChanged: (selected) {
          setState(() {
            SelectedYear = selected;
          });
        },
        controller: yearPageController,
      ),
    );
  }
}

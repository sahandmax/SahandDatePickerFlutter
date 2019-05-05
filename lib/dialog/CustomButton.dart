import 'package:flutter/material.dart';
import 'package:sahand_datepicker_plugin/resources/customcolors.dart';

class CustomRaisedButtom extends StatefulWidget {
  Widget child;
  Function onTap;
  EdgeInsetsGeometry padding;
  EdgeInsetsGeometry margin;
  double width;
  double height;

  CustomRaisedButtom(
      {this.child,
      this.onTap,
      this.padding,
      this.margin,
      this.width,
      this.height});

  createState() => CustomRaisedButtomState();
}

class CustomRaisedButtomState extends State<CustomRaisedButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,

      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [CustomColors.color1, CustomColors.color2],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child:
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: widget.padding,
              child:
          widget.child),
          onTap: widget.onTap,
        ),
      ),
    );
  }
}

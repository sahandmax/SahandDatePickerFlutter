import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sahand_datepicker_plugin/sahand_datepicker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      debugShowCheckedModeBanner: false,
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  createState() => MainState();
}
class MainState extends State<Main> {
  String pickedDate = "";
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Test"),
        ),
        body: Center(
          child: RaisedButton(
              child: Text(pickedDate),
              onPressed: () {
            SahandDatePicker.pickDate(context , 1380, 3).then((picked) {
              setState(() {
                pickedDate = picked;
              });
            });
          }),
        ),
      );
  }
}

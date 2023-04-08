import 'package:flutter/material.dart';

class CustomRouting {
  static void push(BuildContext context,Widget widget){
    Navigator.push(context,MaterialPageRoute(builder: (context) {
      return widget;
    },));
  }
  static void back(BuildContext context){
    Navigator.pop(context);
  }
}
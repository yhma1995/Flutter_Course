import 'package:flutter/material.dart';

class Routing {
  static void push(BuildContext context,Widget widget){
    Navigator.push(context,MaterialPageRoute(builder: (context) {
      return widget;
    },));
  }
}
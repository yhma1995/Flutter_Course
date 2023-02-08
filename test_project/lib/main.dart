import 'package:flutter/material.dart';
import './calculator/calculator.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorWidget() ,
    );
  }
}
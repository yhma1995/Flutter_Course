import 'package:flutter/material.dart';
import './key_widget.dart';

class CalculatorWidget extends StatelessWidget {
  CalculatorWidget({super.key});
  String fitstNumber = '';
  String sNumber = '';
  String operator = '';
  double result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.yellow[500],
              borderRadius: BorderRadius.circular(10)),
        ),
        const Spacer(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          KeyWidget('+', () {
            operator = '+';
          }),
          KeyWidget('*', () {
            operator = '*';
          }),
          KeyWidget('-', () {
            operator = '-';
          }),
          KeyWidget('=', () {
            switch (operator) {
              case '+':
                print(int.parse(fitstNumber) + int.parse(sNumber));
                break;
              case '-':
                print(int.parse(fitstNumber) - int.parse(sNumber));
                break;
              case '*':
                print(int.parse(fitstNumber) * int.parse(sNumber));
                break;
            }
          })
        ]),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          KeyWidget('1', () {
            handler('1');
          }),
          KeyWidget('2', () {
            handler('2');
          }),
          KeyWidget('3', () {
            handler('3');
          })
        ]),
        const SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          KeyWidget('4', () {
            handler('4');
          }),
          KeyWidget('5', () {
            handler('5');
          }),
          KeyWidget('6', () {
            handler('6');
          })
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            KeyWidget('7', () {
              handler('7');
            }),
            KeyWidget('8', () {
              handler('8');
            }),
            KeyWidget('9', () {
              handler('9');
            })
          ]),
        ),
      ],
    )));
  }

  void handler(String value) {
    if (operator == '') {
      fitstNumber += value;
    } else {
      sNumber += value;
    }
   // print('first number is $fitstNumber');
   // print('second number is $sNumber');
   // print('operator number is $operator');
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_project/consts.dart';





class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();

}


class _TestWidgetState extends State<TestWidget> {
  var colors=[Colors.red,Colors.blue,Colors.amber,Colors.cyan,Colors.deepPurple,Colors.lightBlue];
  var color;
  double width=constatnts;
  double height=90;

  // check inline condition
 // bool fakeCondition=true;
 //  fakeCondition?width:90
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Container(
            width: width,
            height: height,
            color: color??colors.first,
          ),
          SizedBox(height: 200,),
          GestureDetector(
              onTap: () {
                var random=Random();
                var randomNumber=random.nextInt(colors.length);
                color=colors[randomNumber];
                if(randomNumber%2==0){
                  width=180;
                  height=180;
                }else{
                  width=90;
                  height=90;
                }
                setState(() {
                },);
              },
              child: Text('change color '))
        ],
      ),
    );
  }
}

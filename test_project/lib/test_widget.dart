import 'package:flutter/material.dart';

class ContainerExample extends StatelessWidget {
  const ContainerExample
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
        //padding: EdgeInsets.only(top: 50),
        //padding: EdgeInsets.all(20),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
        color: Colors.amber,
        //borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.red,width: 5),
        shape: BoxShape.circle
        ),
       // child: Text('test message'),
      ),
    );
  }
}
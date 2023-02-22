import 'package:flutter/material.dart';
import 'package:test_project/auth/login.dart';
import 'package:test_project/calculator/calculator.dart';
import 'package:test_project/statefull/test.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barbod Application',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.grey,
       // leading: Icon(Icons.arrow_back_ios_new_outlined),
        actions: [
       //   IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit)),
       //   Icon(Icons.home, color: Colors.green, size: 25),
       //   Icon(Icons.notifications)
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) => CalculatorWidget(),));
              },
              child: Icon(Icons.calculate,size: 70,color: Colors.blueGrey,)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) => TestWidget(),));
              },
              child: Icon(Icons.transfer_within_a_station,size: 70,color: Colors.blueGrey,)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) => LoginWidget(),));
              },
              child: Icon(Icons.login,size: 70,color: Colors.blueGrey,)),
        ),
      ],),
    );
  }
}

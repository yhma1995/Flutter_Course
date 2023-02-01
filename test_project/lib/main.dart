import 'package:flutter/material.dart';

void main() {
  runApp(Test());
}

class Test extends StatelessWidget {
  const Test();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: SafeArea(child: horizontalWidget()),
      )
    );
  }
}
class horizontalWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
               Text(
              'hello world :)',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.red[500],
                  fontWeight: FontWeight.bold),
            ),
            Text('1'),
            Text('2')
      ],
    );
}
}
class VerticalWidget extends StatelessWidget {
  const VerticalWidget();

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
             Text(
              'hello world :)',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.red[500],
                  fontWeight: FontWeight.bold),
            ),
            Text('1'),
            Text('2')
          ],
        );
  }
}


/**
 class Test extends StatelessWidget {
  Test();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'hello world :)',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.red[500],
                  fontWeight: FontWeight.bold),
            ),
          )),
        ));
  }
}
 */


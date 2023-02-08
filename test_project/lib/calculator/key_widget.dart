import 'package:flutter/material.dart';

class KeyWidget extends StatelessWidget {
  String number;
  Function tapCallBack;
 KeyWidget(this.number,this.tapCallBack);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //print('the number which has been clicke is '+number);
        tapCallBack();
      },
      child:  Container(
      //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      width: 90,
      height: 90,
      decoration: BoxDecoration(
          color: Colors.grey[500], borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        number,
        style: TextStyle(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
      )),
    ),
    );
  }
}

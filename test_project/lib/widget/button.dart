import 'package:flutter/material.dart';
import 'package:test_project/core/theme.dart';
class ButtonWidget extends StatefulWidget {
  //Function
  VoidCallback callback;
  String title;
  bool loading;
  ButtonWidget({required this.callback,required this.title,required this.loading}) ;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:  ()async {
      widget.callback();
      },
      child:widget.loading?
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: SizedBox(
            width: 25,height: 25,
            child: CircularProgressIndicator(color: AppColors.btn,backgroundColor: Colors.transparent)),
      )
          : Container(
        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 20),
        padding: EdgeInsets.symmetric(vertical: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.btn,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(widget.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),textAlign: TextAlign.center,),
      ),
    );
  }
}

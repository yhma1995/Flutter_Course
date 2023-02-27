import 'package:flutter/material.dart';
import 'package:test_project/auth/code.dart';
import 'package:test_project/core/constants.dart';
import 'package:test_project/core/routing.dart';
import 'package:test_project/core/theme.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/widget/button.dart';

class RegsiterWidget extends StatefulWidget {
  const RegsiterWidget({Key? key}) : super(key: key);


  @override
  State<RegsiterWidget> createState() => _RegsiterWidgetState();
}

class _RegsiterWidgetState extends State<RegsiterWidget> {
  String email='';
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Image.asset('assets/images/logo.png',width: 150,height: 150,),
                SizedBox(height: 50,),
              TextFormField(
                onChanged: (value) {
                  email=value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.hint,
                  ),
                  hintText: 'input youre email address',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.hint.withOpacity(.5),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hint, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.hint.withOpacity(.5), width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.white,
                ),
              ),
              Spacer(),
              /*

                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 5.0, color: Colors.blue),
                  ) ,
                onPressed: (){

                },
                child: Text(
                  "Submit",
                ),
              ),
               */
            ButtonWidget(callback: () async{
              Map<String, String> body = {
                'email': email,
                'type': 'signup',
              };
              Map<String, String> header={
                'lang':'en'
              };
              loading=true;
              setState(() {

              });
              http.Response response=await http.post(Uri.parse(base_url+'api/v1/user/sendCode'),body: body,
                  headers: header);
              loading=false;
              setState(() {

              });

              if(response.statusCode==200){
                Routing.push(context,CodeWidget());
              }

            },title: 'Submit',loading: loading,)
            ],
          ),
        ),
      ),
    );
  }
}

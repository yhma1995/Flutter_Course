import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:test_project/core/constants.dart';
import 'package:test_project/core/routing.dart';
import 'package:test_project/core/theme.dart';
import 'package:test_project/pages/widget/button.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email='';
  String pass='';
  bool loading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
            SizedBox(height: 20,),
            TextFormField(
              onChanged: (value) {
                pass=value;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.hint,
                ),
                hintText: 'input youre pass ',
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
                'password': pass,
              };
              Map<String, String> header={
                'lang':'en'
              };
              loading=true;
              setState(() {

              });
              http.Response response=await http.post(Uri.parse(base_url+'api/v1/user/login'),body: body,
                  headers: header);
              loading=false;
              setState(() {

              });
              if(response.statusCode==200){
                var res=jsonDecode(response.body);
               var hive=Hive.box('shop');
               hive.put('token',res['result']['token']);
               CustomRouting.back(context);
              }

            },title: 'Submit',loading: loading,)
          ],
        ),
      )
    );
  }
}

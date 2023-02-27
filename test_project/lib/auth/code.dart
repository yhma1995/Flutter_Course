import 'package:flutter/material.dart';
import 'package:test_project/core/constants.dart';
import 'package:test_project/core/theme.dart';
import 'package:http/http.dart' as http;

class CodeWidget extends StatefulWidget {
  const CodeWidget({Key? key}) : super(key: key);


  @override
  State<CodeWidget> createState() => _CodeWidgetState();
}

class _CodeWidgetState extends State<CodeWidget> {
  String email='';
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
                  labelText: 'Code',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.hint,
                  ),
                  hintText: 'input youre code address',
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
              GestureDetector(
                onTap:  ()async {
                  Map<String, String> body = {
                    'email': email,
                    'type': 'signup',
                  };
                  Map<String, String> header={
                    'lang':'en'
                  };
                  http.Response response=await http.post(Uri.parse(base_url+'api/v1/user/sendCode'),body: body,
                      headers: header);
                  print(response.statusCode);
                  print(response.body);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.btn,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text('Send Code',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),textAlign: TextAlign.center,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

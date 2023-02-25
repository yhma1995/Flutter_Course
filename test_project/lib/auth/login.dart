import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  int a=0;
  LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool userNameValid = false;
  String username='';
  //widget.a;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // for(var i=0;i<3;i++)
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10),
              child: TextFormField(
                onChanged: (value) {
                  //value.length =>return length of string
                 // value.contains('a') => check if special character's is in string or not
                  //value[0]
                  if(value.length<4){
                    userNameValid=false;
                  }else{
                    userNameValid=true;
                    username=value;
                  }
                  setState(() {

                  });
                },
                decoration: InputDecoration(
                    hintText: 'input your user name',
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey[900]!, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    )
                ),
              ),
            ),
            if(userNameValid) Icon(Icons.check_circle, color: Colors.green,)

            else
              Text('user name must contain 4 letters',
                style: TextStyle(color: Colors.grey),textAlign: TextAlign.end),

            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10),
              child: TextFormField(
                onChanged: (value) {
                  print(value);
                },
                obscureText: true,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.remove_red_eye, color: Colors.grey,)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey[900]!, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'input your password',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(vertical: 15),
              width: MediaQuery
                  .of(context)
                  .size
                  .width * .7,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(child: Text('Login', style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),)),
            )
          ],
        ),
      ),
    );
  }
}

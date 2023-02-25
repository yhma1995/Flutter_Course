import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HttpWidget extends StatefulWidget {
   HttpWidget({Key? key}) : super(key: key);

  @override
  State<HttpWidget> createState() => _HttpWidgetState();
}

class _HttpWidgetState extends State<HttpWidget> {
  String text='data is laoding ...... please waite';
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            http.Response response=await http.get(Uri.parse('https://dummyjson.com/products/1'));
            text=response.body;
            var item=jsonDecode(text);
            setState(() {

            });
          },
          child: Icon(Icons.get_app,color: Colors.white,),
        ),
        body: Column(
          children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text,style: TextStyle(fontSize: 20),),
                )
          ],
        ),
      ),
    );
  }
}

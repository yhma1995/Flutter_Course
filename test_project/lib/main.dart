import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test_project/pages/home.dart';
import 'package:test_project/pages/product/product.dart';

void main()async{
  await Hive.initFlutter();
  await Hive.openBox('shop');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeWidget(),
    );
  }
}
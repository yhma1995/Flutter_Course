import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test_project/pages/home.dart';
import 'package:test_project/pages/product/product.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/utils/getx_test.dart';
void main() async {
  await Hive.initFlutter();
  await Hive.openBox('shop');
  runApp(GetTestWidget());
}
/*
class MyApp1 extends StatelessWidget {
  const MyApp1();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            /*
 Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
              ),
            ),
            Flexible(flex: 3,
              child: Container(
                color: Colors.green,
              ),
            ),
            */
           // SvgPicture.asset('assets/images/name.svg')
           // SvgPicture.network('url')
           // SvgPicture.string('url')
            Wrap(
              children: [
                for (var i = 0; i < 12; i++)
                  Container(
                    width: 60,
                    height: 60,
                    color: i % 2 == 0 ? Colors.amber : Colors.red,
                  )

              ],
            )
          ],
        ),
      ),
    );
  }
}

*/


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

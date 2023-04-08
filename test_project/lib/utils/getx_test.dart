import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/routing.dart';

class GetTestWidget extends StatelessWidget {
  const GetTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Test2(),
    );
  }
}

class testController extends GetxController {
  var number = 0.obs;

  void setNumber(int number) {
    this.number += number;
  }
}

class Test2 extends StatelessWidget {
  final testController controller =Get.put( testController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () =>
          //Get.back()
          //Get.to()
          //Get.off()
         // Get.offAll()
             Get.to(Test3()),
          child: Text('next')),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  controller.setNumber(5);
                  //  setState(() {
                  //value=value+5;
                  //   value+=5;
                  // });
                },
                child: Obx(
                  () => Text(
                    controller.number.value.toString(),
                    style: TextStyle(fontSize: 50),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class Test3 extends StatelessWidget {
  final controller=Get.find<testController>();
  Test3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  controller.setNumber(5);
                  //  setState(() {
                  //value=value+5;
                  //   value+=5;
                  // });
                },
                child: Text(
                    'Increament',
                    style: TextStyle(fontSize: 50),
                  )),
          ],
        ),
      ),
    );
  }
}

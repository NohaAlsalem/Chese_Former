import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';

class Show_Resulte extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
final homeController controller=Get.find();
   // final homeController controller =Get.put(homeController(),permanent: true);
    return Scaffold(
      body:
      Center(
          child:Row(
                children: [
                  TextButton(onPressed: (){controller.increment();}, child: Text('+')),
                 GetBuilder<homeController>(builder:(controller)=> TextButton(onPressed: (){
                   Get.toNamed('/home');
                 }, child: Text('${controller.num}'))),
                 TextButton(onPressed: () {controller.decrement();}, child: Text('-')),
                ],
              ),)

          // GetX<homeController>(
          //   init: homeController(),
          //   builder: (controller)=> Row(
          //     children: [
          //       TextButton(onPressed: (){controller.increment();}, child: Text('+')),
          //       TextButton(onPressed: (){}, child: Text('${controller.num.value}')),
          //       TextButton(onPressed: (){controller.decrement() ;}, child: Text('-')),
          //     ],
          //   ),
          // ),
    );
  }
}

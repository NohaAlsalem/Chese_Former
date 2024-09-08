import 'package:flutter/material.dart';
import 'package:get/get.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // final c=Get.lazyPut(() => homeController(),fenix: true);
    //final homeController controller =Get.put(homeController(),permanent: true);
    return
       Scaffold(
        appBar: AppBar(
          title: TextButton(child: const Text('press',style: TextStyle(color: Colors.white),),onPressed: (){
            Get.toNamed('/show_result');
           // Get.to(Show_Resulte());
          },),
        ),
        body: Center(child: TextButton(onPressed: (){
          Get.toNamed('/');
        },
        child: const Text('press2'),),),
      );

  }
}

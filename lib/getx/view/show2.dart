import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class shwo2 extends StatelessWidget {

final homeController controller=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child:Text('${controller.num}')),
    );
  }
}

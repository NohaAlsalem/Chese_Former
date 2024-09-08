import 'package:get/get.dart';

import '../controller/controller.dart';

class my_Binding implements Bindings{
  @override
  void dependencies() {
    Get.put(homeController(),permanent: true);
   // Get.lazyPut(() => homeController());
  }
}
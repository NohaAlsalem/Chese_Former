import 'package:get/get.dart';

class homeController extends GetxController{
 // RxInt num=0.obs;
  int num=0;
  void increment(){
    num++;
    //this we need it for GetBuilder only
    update();
  }
  void decrement(){
    num--;
    update();
  }
  @override
  void onInit() {
    print('on initial state');
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onReady() {
    print('on ready state');
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void onClose() {
    print('on close state');
    // TODO: implement onClose
    super.onClose();
  }
}
import 'package:get/get.dart';

class DrawerControllers extends GetxController{
  
  void navigateTo(String routeName){
    Get.back();
    Get.toNamed(routeName);
  }
}
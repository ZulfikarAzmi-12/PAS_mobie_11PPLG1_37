import 'package:get/get.dart';
import 'package:pas/controller/drawer_controller.dart';


class DrawerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DrawerControllers>(() => DrawerControllers());
  }

}
import 'package:get/get.dart';
import 'package:pas/controller/favorit_controller.dart';
import 'package:pas/controller/home_controller.dart';
import 'package:pas/controller/profile_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }

}
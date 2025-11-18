import 'package:get/get.dart';
import 'package:pas/controller/splashscreen_controller.dart';

class SplashscreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }

}
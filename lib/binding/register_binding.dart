import 'package:get/get.dart';
import 'package:pas/controller/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }

}
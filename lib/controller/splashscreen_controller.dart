import 'package:get/get.dart';
import 'package:pas/routes/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checklogin();
  }

  checklogin() async {
    await Future.delayed(Duration(seconds: 3));
    final prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;
    if (isLogin) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
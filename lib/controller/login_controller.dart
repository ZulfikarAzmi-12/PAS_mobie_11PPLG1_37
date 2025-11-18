import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pas/api/client_network.dart';
import 'package:http/http.dart' as http;
import 'package:pas/models/login_model.dart';
import 'package:pas/routes/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();


  var isLoading = false.obs;

  void login() async {
    final url = "${ClientNetwork.baseUrl}/latihan/login.php";

    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse(url),
        body: {
          'username': usernameController.text.trim(),
          'password': passwordController.text.trim(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final result = LoginModel.fromJson(data);

        if (result.status) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', result.token ?? "");
          await prefs.setBool('isLogin', true);



          Get.offAllNamed(AppRoutes.home);
        } else {
          Get.snackbar('Gagal', result.message ?? 'Login gagal');
        }
      } else {
        Get.snackbar('Error', 'Server error (${response.statusCode})');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  void registerPage(){
    Get.offAllNamed(AppRoutes.register);
  }
}
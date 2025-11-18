import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas/api/client_network.dart';
import 'package:pas/models/register_model.dart';
import 'package:pas/routes/route.dart';

class RegisterController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  var isLoading = false.obs;

  void register() async {
    final url = "${ClientNetwork.baseUrl}/latihan/register-user.php";

    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse(url),
        body: {
          "username": usernameController.text.trim(),
          "password": passwordController.text.trim(),
          "full_name": nameController.text.trim(),
          "email": emailController.text.trim(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final result = RegisterModel.fromJson(data);

        if (result.status) {
          Get.snackbar("Success", result.message);
          Get.offAllNamed(AppRoutes.login);  // kembali ke login
        } else {
          Get.snackbar("Gagal", result.message);
        }
      } else {
        Get.snackbar("Error", "Server error (${response.statusCode})");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

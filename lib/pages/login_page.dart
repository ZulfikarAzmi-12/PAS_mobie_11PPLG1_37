import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/controller/login_controller.dart';
import 'package:pas/widget/custom_button.dart';
import 'package:pas/widget/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.green,
                child: const Icon(
                  Icons.lock_outline,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Please complete the input",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),

              CustomTextField(
                icon: Icons.person,
                hintText: "Username",
                controller: controller.usernameController,
              ),
              CustomTextField(
                icon: Icons.visibility,
                obscureText: true,
                hintText: "Password",
                controller: controller.passwordController,
              ),
              const SizedBox(height: 24),

              CustomButton(
                text: "Sign in",
                onPressed: () {
                  controller.login();
                },
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: "Register",
                onPressed: () {
                 controller.registerPage();
                },
              ),
              const SizedBox(height: 16),

            ],
          ), 
        ),
      ),
    );
  }
}
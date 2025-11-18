import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/controller/register_controller.dart';
import 'package:pas/widget/custom_button.dart';
import 'package:pas/widget/custom_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final controller = Get.find<RegisterController>();

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
                backgroundColor: const Color(0xFF6BA892),
                child: const Icon(
                  Icons.lock_outline,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Hello",
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
                controller: controller.usernameController
              ),
              CustomTextField(
                icon: Icons.visibility,
                obscureText: true,
                hintText: "Password",
                controller: controller.passwordController
              ),

              CustomTextField(
                icon: Icons.abc,
                hintText: "Full name",
                controller: controller.nameController
              ),
              CustomTextField(
                icon: Icons.mail,
                hintText: "Email",
                controller: controller.emailController
              ),
              CustomButton(
                text: "Register",
                onPressed: () {
                  controller.register();
                },
              ),
              const SizedBox(height: 16),
              
            ]
          )
        )
      )
    );
  }
}
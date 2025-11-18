import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/controller/splashscreen_controller.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});

  final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.bookmark,
            color: Colors.white,
            size: 40,
          ),
        ),
      )
    );
  }
}
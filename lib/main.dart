import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/routes/page.dart';
import 'package:pas/routes/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.splashscreen,
      getPages: AppPage.page,
    );
  }
}

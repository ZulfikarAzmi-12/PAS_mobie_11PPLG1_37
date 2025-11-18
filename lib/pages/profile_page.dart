import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/controller/profile_controller.dart';
import 'package:pas/widget/custom_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("Nama : Zulfikar Azmi Fakhrudin", 
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: CustomButton(
              text: "Logout", 
              onPressed: () {
                controller.logout();
              },
              backgroundColor: Colors.red,
              ),
            ),
          ], 
        ),
      ),
    );
  }
}
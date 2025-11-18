import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/controller/drawer_controller.dart';



class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  
  final controller = Get.find<DrawerControllers>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () => controller.navigateTo('/home'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () => controller.navigateTo('/profile'),
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text("Favorite"),
            onTap: () => controller.navigateTo('/favorit'),
          ),
        ],
      ),
    );
  }
}
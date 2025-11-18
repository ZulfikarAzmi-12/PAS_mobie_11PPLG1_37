import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final bool obscureText;
  final String hintText;

  const CustomTextField({
    required this.controller,
    Key? key,
    required this.icon,
    this.obscureText = false,
    this.hintText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.black),
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}

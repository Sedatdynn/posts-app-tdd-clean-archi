import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({required this.controller, required this.hintText, super.key});
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}

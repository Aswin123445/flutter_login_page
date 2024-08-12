// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? icon;
  final String hintText;
  final bool obscure;
  const CustomText({
    Key? key,
    required this.controller,
    this.validator,
    this.icon,
    required this.hintText,
    required this.obscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscure,
      controller: controller,
      style: const TextStyle(
        fontSize: 20,
        letterSpacing: .1,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: icon,
      ),
    );
  }
}

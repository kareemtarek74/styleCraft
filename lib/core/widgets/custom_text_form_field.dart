import 'package:flutter/material.dart';

import '../utils/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.keyboardType,
      required this.hintText,
      this.suffixIcon,
      this.controller,
      this.obscureText = false});
  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'It is required';
        }
        return null;
      },
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle:
              Styles.styleRegular14(context).copyWith(color: Colors.black),
          contentPadding: const EdgeInsets.all(15),
          border: buildBorder(),
          focusedBorder: buildBorder(),
          enabledBorder: buildBorder(),
          errorBorder: buildErrorBorder(),
          focusedErrorBorder: buildErrorBorder()),
    );
  }

  OutlineInputBorder buildErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: Color(0xffBABABA)));
  }
}

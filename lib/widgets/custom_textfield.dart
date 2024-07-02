// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({super.key, this.hintText});
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}

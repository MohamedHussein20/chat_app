// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({super.key, this.onChanged, this.hintText});
  String? hintText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        } else if (data.length < 8) {
          return 'E-mail and Password cannot be less than 8 characters';
        }
      },
      onChanged: onChanged,
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

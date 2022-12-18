import 'package:date/Constants/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatelessWidget {
  CustomInput(
      {super.key,
      required this.hint,
      this.obscureText = false,
      this.inputType = TextInputType.text});

  final TextInputType inputType;
  final String hint;
  final bool obscureText;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          hintText: hint,
          enabledBorder: customInputBorderStyle(),
          disabledBorder: customInputBorderStyle(),
          focusedBorder: customInputBorderStyle(),
        ),
      ),
    );
  }

  OutlineInputBorder customInputBorderStyle() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: CustomColors.mainColor,
      ),
      borderRadius: BorderRadius.circular(30),
    );
  }
}

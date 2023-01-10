import 'package:date/Constants/CustomColors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.buttonText, required this.onTap});
  final Function onTap;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap(),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 20, color: CustomColors.mainColor),
      ),
    );
  }
}

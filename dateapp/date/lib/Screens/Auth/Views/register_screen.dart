import 'package:date/Screens/Auth/Views/register_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/custom_text_input.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final licenceChecked = false.obs;

  final email = CustomInput(hint: "E-posta");
  final pass = CustomInput(
    hint: "Şifre",
    obscureText: true,
  );

  void register() {}

  @override
  Widget build(BuildContext context) {
    return mainbuild(context);
  }
}

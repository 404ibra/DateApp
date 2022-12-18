import 'package:date/Constants/CustomColors.dart';
import 'package:date/Screens/Auth/Components/custom_button.dart';
import 'package:date/Screens/Auth/Components/custom_text_button.dart';
import 'package:date/Screens/Auth/Components/custom_text_input.dart';
import 'package:date/Screens/Auth/Views/LoginScreen.dart';
import 'package:date/Screens/Auth/Views/register_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:date/routes/routes.dart';

import '../top_logo_sections.dart';

extension UI on LoginScreen {
  Widget mainbuild(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Column(
          children: [
            LogoSection(),
            CustomInput(hint: "E-posta"),
            12.heightBox,
            CustomInput(
              hint: "Şifre",
              obscureText: true,
            ),
            12.heightBox,
            CustomButton(
              text: "Giriş Yap",
            ),
            12.heightBox,
            CustomTextButton(
              buttonText: "Şifremi Unuttum",

              //TO DO
              onTap: () {},
            ),
            140.heightBox,
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Hesabınız yok mu ?",
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade700)),
              TextSpan(
                  text: "  Kayıt Ol",
                  style: TextStyle(fontSize: 18, 
                  fontWeight: FontWeight.bold,
                  color: CustomColors.mainColor),
                  recognizer: TapGestureRecognizer()..onTap = (){
                  Get.to(RegisterScreen());
                  })
            ])),
            Row(
              children: [

              ],
            )
          ],
        )
      ]),
    );
  }
}

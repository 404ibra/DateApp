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

import '../top_logo_sections.dart';

extension UI on LoginScreen {
  Widget mainbuild(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Column(
          children: [
            const LogoSection(),
            email,
            12.heightBox,
            password,
            12.heightBox,
            Obx(() {
              return CustomButton(
                isLoading: isLoading.value,
                text: "Giriş Yap",
                onTap: login,
              );
            }),
            12.heightBox,
            CustomTextButton(
              buttonText: "Şifremi Unuttum",

              //TO DO
              onTap: () {},
            ),
            110.heightBox,
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Hesabınız yok mu ?",
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade700)),
              TextSpan(
                  text: "  Kayıt Ol",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.mainColor),

                  //   IMPORT LOOK AFTER
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(RegisterScreen());
                    })
            ])),
            Row(
              children: [],
            )
          ],
        )
      ]),
    );
  }
}

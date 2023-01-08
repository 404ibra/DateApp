import 'package:date/Screens/Auth/Components/custom_app_bar.dart';
import 'package:date/Screens/Auth/Components/custom_text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Components/custom_button.dart';
import '../top_logo_sections.dart';

class LostPassScreen extends StatelessWidget {
  LostPassScreen({super.key});

  final isLoading = false.obs;

  var email = CustomInput(
    hint: "E-posta",
    inputType: TextInputType.emailAddress,
  );

  void login() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email.controller.text);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text("Email Adresinizi Kontrol Edin..."),
          actions: [
            const Text("Tamam").onInkTap(() {
              Get.back();
              Get.back();
            })
          ],
        );
      },
    );
  }

  void lastpass() async {}

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: const CustomAppBar(
        isTransParent: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Column(
          children: [
            const LogoSection(),
            email,
            12.heightBox,
            Obx(() {
              return CustomButton(
                isLoading: isLoading.value,
                text: "Şifremi Sıfırla",
                onTap: login,
              );
            }),
            12.heightBox,
            70.heightBox,
          ],
        )
      ]),
    );
  }
}

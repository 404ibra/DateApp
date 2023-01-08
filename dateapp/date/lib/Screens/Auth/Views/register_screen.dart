import 'package:date/Screens/Auth/Components/custom_snackbar.dart';
import 'package:date/Screens/Auth/Views/create_initial_profile.dart';
import 'package:date/Screens/Auth/Views/register_screen_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/custom_text_input.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final licenceChecked = false.obs;

  final email = CustomInput(
    hint: "E-posta",
    inputType: TextInputType.emailAddress,
  );
  final pass = CustomInput(
    hint: "Şifre",
    obscureText: true,
  );

  Future<void> register() async {
    if (licenceChecked.isFalse) {
      CustomSnackBar.show("Sözleşmeyi Onaylamadınız",
          "Devam etmek için lütfen sözleşmeyi onaylanız");
      return;
    }

    // createUserWithEmailAndPassword gibi istekler UserCredential döndürür
    // late mevzusunu ben ekledim error veriyordu diğer türlü

    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.controller.text, password: pass.controller.text);
    } on FirebaseAuthException catch (err) {
      if (err.code == "email-already-in-use")
        CustomSnackBar.show("Geçersiz Email", "Email zaten kullanımda");

      if (err.code == "invalid-email") {}
      CustomSnackBar.show("Geçersiz Email", "Geçersiz Email");

      if (err.code == "weak-password") {}
      CustomSnackBar.show("Zayıf Parola", "Zayıf parola");
    } catch (e, s) {}
    print(userCredential);

    if (userCredential == null) {
      CustomSnackBar.show("Bir hata oluştu", "Lütfen Tekrar Deneyin");
      return;
    }
    Get.offAll(() => CreateInitialProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    return mainbuild(context);
  }
}

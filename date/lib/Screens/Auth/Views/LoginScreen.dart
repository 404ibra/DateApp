import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date/Screens/Auth/Components/custom_snackbar.dart';
import 'package:date/Screens/Auth/Components/custom_text_input.dart';
import 'package:date/Screens/Auth/Views/login_screen_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final isLoading = false.obs;

  var email = CustomInput(
    hint: "E-posta",
    inputType: TextInputType.emailAddress,
  );
  var password = CustomInput(
    hint: "Şifre",
    obscureText: true,
  );

  void login() async {
    UserCredential? user;
    isLoading.value = true;
    try {
      user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.controller.text, password: password.controller.text);
    } on FirebaseAuthException catch (ex) {
      switch (ex.code) {
        case "invalid-email":
          CustomSnackBar.show("Giriş Başarısız", "E-posta Geçersiz");
          break;
        case "user-disabled":
          CustomSnackBar.show(
              "Giriş Başarısız", "Kullanıcı Sistemden Kaldırıldı");
          break;
        case "user-not-found":
          CustomSnackBar.show("Giriş Başarısız", "Kullanıcı Bulunumadı");
          break;
        case "invalid-password":
          CustomSnackBar.show("Giriş Başarısız", "Şifreniz Hatalı");
          break;
        default:
          CustomSnackBar.show("Giriş Başarısız", ex.code);
      }
    } catch (e, s) {
      CustomSnackBar.show(
          "Bilinmeyen Hata", "Bilinmeyen Bir Hata Meydana Geldi");
    }
    isLoading.value = false;
    if (user == null) {
      return;
    }
  }

  // Future lastpass() async {
  //   await Get.to(() => LostPassScreen());
  // }

  @override
  Widget build(BuildContext context) {
    return mainbuild(context);
  }
}

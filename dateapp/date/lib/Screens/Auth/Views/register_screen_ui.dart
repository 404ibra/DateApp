//Packages
import 'package:date/Constants/CustomColors.dart';
import 'package:date/Screens/Auth/Components/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

//Local
import 'package:date/Screens/Auth/Components/custom_app_bar.dart';
import 'package:date/Screens/Auth/Views/register_screen.dart';
import '../Components/custom_text_button.dart';
import '../top_logo_sections.dart';

extension UI on RegisterScreen {
  Widget mainbuild(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: "Kayıt Ol",
        isTransParent: true,
      ),
      body: Column(
        children: [
          const LogoSection(
            isSmall: true,
          ),
          Column(
            children: [
              12.heightBox,
              email,
              12.heightBox,
              pass,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: [
                  Obx(() {
                    return Checkbox(
                        fillColor:
                            MaterialStateProperty.all(CustomColors.mainColor),
                        value: licenceChecked.value,
                        onChanged: ((checked) {
                          licenceChecked.value = checked ?? false;
                        }));
                  }),
                  RichText(
                      softWrap: true,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Kullanıcı sözleşmesi",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: CustomColors.mainColor),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                launchUrl(Uri.parse("www.todo.com"));
                              }),
                        TextSpan(
                            text: "'ni okudum \nve kabul ediyorum.",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black87),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                licenceChecked.value;
                              })
                      ])).expand()
                ].row(),
              ),
              12.heightBox,

              // TO DO
              //bu normalde obx ile sarılıyor fakat bende hata verdi.
              CustomButton(
                text: "Kayıt Ol",
                onTap: register,
              ),
              CustomTextButton(
                buttonText: "Giriş Yap",
                onTap: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}

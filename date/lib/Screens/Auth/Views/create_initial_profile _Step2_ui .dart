import 'dart:io';
import 'dart:ui';

import 'package:date/Helpers/Profile_Helpers.dart';
import 'package:date/Screens/Auth/Components/custom_app_bar.dart';
import 'package:date/Screens/Auth/Components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'create_initial_profile_Step2.dart';

extension UI on CreateProfileStep2Screen {
  @override
  Widget mainbuild(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: "Profilini Oluştur",
        isTransParent: true,
      ),
      body: Column(
        children: [
          Column(
            children: [
              12.heightBox,
              ProfileHelpers()
                  .entrcypedName(enteredName, isProfileVisible)!
                  .text
                  .make(),
              22.heightBox,
              //profil önizlemesi
              profileReview(),
              12.heightBox,
              12.heightBox,
              // TO DO
              //bu normalde obx ile sarılıyor fakat bende hata verdi.
              CustomButton(
                text: "Devam",
                onTap: completeRegister,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget profileReview() {
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipOval(
            child: Image.file(
              File(pickedImagefile),
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: ClipOval(
                child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: isProfileVisible ? 0.0 : 10.0,
                sigmaY: isProfileVisible ? 0.0 : 10.0,
              ),
              child: Container(
                padding: const EdgeInsets.all(24),
                color: Colors.black12,
              ),
            )),
          )
        ],
      ),
    );
  }
}

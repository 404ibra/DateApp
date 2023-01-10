import 'dart:io';
import 'dart:ui';

import 'package:date/Constants/CustomColors.dart';
import 'package:date/Screens/Auth/Components/custom_app_bar.dart';
import 'package:date/Screens/Auth/Components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Profile_Visibility_Explanantions.dart';
import 'create_initial_profile.dart';

extension UI on CreateInitialProfileScreen {
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
              Obx(() => entrcypedName(enteredName.value)!.text.make()),
              22.heightBox,
              //profil önizlemesi
              profileReview().onInkTap(() {
                pickPhoto();
              }),
              12.heightBox,
              name,
              12.heightBox,
              5.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Row(
                  children: [
                    Obx(
                      () => ProfileVisibilityExplanantions(
                          isProfileVisible: isProfileVisible.value),
                    ),
                  ],
                ),
              ),
              5.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: [
                  Obx(() {
                    return Checkbox(
                        fillColor:
                            MaterialStateProperty.all(CustomColors.mainColor),
                        value: isProfileVisible.value,
                        onChanged: ((checked) {
                          isProfileVisible.value = checked ?? false;
                        }));
                  }),
                  "Profilim Gözüksün".text.make()
                ].row().objectCenterLeft(),
              ),
              12.heightBox,

              // TO DO
              //bu normalde obx ile sarılıyor fakat bende hata verdi.
              CustomButton(
                text: "Devam",
                onTap: gotoNextStep,
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
            child: Obx(
              () => pickedImagefile.value == null
                  ? const Icon(
                      Icons.add_a_photo_outlined,
                      size: 120,
                    )
                  : Image.file(
                      File(pickedImagefile.value!),
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          Center(
            child: ClipOval(
              child: Obx(() {
                return BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: isProfileVisible.value ? 0.0 : 10.0,
                    sigmaY: isProfileVisible.value ? 0.0 : 10.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    color: Colors.black12,
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

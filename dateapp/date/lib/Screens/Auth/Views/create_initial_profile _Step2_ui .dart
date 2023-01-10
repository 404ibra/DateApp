import 'dart:io';
import 'dart:ui';

import 'package:date/Constants/CustomColors.dart';
import 'package:date/Helpers/Profile_Helpers.dart';
import 'package:date/Screens/Auth/Components/custom_app_bar.dart';
import 'package:date/Screens/Auth/Components/custom_button.dart';
import 'package:date/Screens/Auth/Components/custom_profile_image.dart';
import 'package:date/Screens/Auth/Views/Profile_Visibility_Explanantions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

//LOCAL
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
              24.heightBox,
              Row(
                children: [
                  const WidthBox(30),
                  CustomProfileImage(
                      isProfileVisible: isProfileVisible,
                      diskfilePath: pickedImagefile),
                  const WidthBox(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileHelpers()
                          .entrcypedName(enteredName, isProfileVisible)!
                          .text
                          .size(19)
                          .make(),
                      12.heightBox,
                      const WidthBox(1),
                      ProfileVisibilityExplanantions(
                          isProfileVisible: isProfileVisible)
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              25.heightBox,
              "Sizi Tanımak İsteriz:".text.size(14).make(),
              12.heightBox,
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    genderIcon("f"),
                    const WidthBox(5),
                    genderIcon("m")
                  ],
                );
              }),
              SizedBox(
                height: 180,
                child: ListWheelScrollView(
                  itemExtent: 31,
                  diameterRatio: 0.5,
                  children: [
                    "12".text.make(),
                    "12".text.make(),
                    "12".text.make(),
                    "12".text.make(),
                    "12".text.make(),
                    "12".text.make(),
                    "12".text.make(),
                    "12".text.make(),
                    "12".text.make(),
                    "12".text.make(),
                    "12".text.make(),
                    "12".text.make(),
                  ],
                ),
              ),

              12.heightBox,
              12.heightBox,
              // TO DO
              //bu normalde obx ile sarılıyor fakat bende hata verdi.
              CustomButton(
                text: "Kayıt Ol",
                onTap: () => completeRegister(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget genderIcon(String gender) {
    var genderColor = gender == "f" ? Colors.pink : Colors.blue.shade800;
    return Icon(
      gender == "f" ? Icons.woman_outlined : Icons.man_outlined,
      size: 90,
      color: selectedgender.value == gender
          ? genderColor
          : Colors.blueGrey.shade200,
    ).onInkTap(() {
      selectedgender.value = gender;
    });
  }

  // Widget profileReview() {
  //   return SizedBox(
  //     height: 100,
  //     width: 101,
  //     child: Stack(
  //       fit: StackFit.expand,
  //       children: <Widget>[
  //         ClipOval(
  //           child: Image.file(
  //             File(pickedImagefile),
  //             fit: BoxFit.fill,
  //           ),
  //         ),
  //         Center(
  //           child: ClipOval(
  //               child: BackdropFilter(
  //             filter: ImageFilter.blur(
  //               sigmaX: isProfileVisible ? 0.0 : 10.0,
  //               sigmaY: isProfileVisible ? 0.0 : 10.0,
  //             ),
  //             child: Container(
  //               padding: const EdgeInsets.all(24),
  //               color: Colors.black12,
  //             ),
  //           )),
  //         )
  //       ],
  //     ),
  //   );
  // }
}

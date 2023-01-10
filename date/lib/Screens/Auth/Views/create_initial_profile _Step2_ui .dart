import 'dart:io';
import 'dart:ui';

import 'package:date/Constants/CustomColors.dart';
import 'package:date/Helpers/Profile_Helpers.dart';
import 'package:date/Screens/Auth/Components/custom_app_bar.dart';
import 'package:date/Screens/Auth/Components/custom_button.dart';
import 'package:date/Screens/Auth/Views/Profile_Visibility_Explanantions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                  profileReview(),
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

              SizedBox(
                // height: 40,
                // width: 200,
                child: CupertinoSlidingSegmentedControl<String>(
                  padding: const EdgeInsets.all(20),
                  children: const {
                    "Female": Text(
                      "Kadın",
                      style: TextStyle(fontSize: 20),
                    ),
                    "Male": Text("Erkek", style: TextStyle(fontSize: 20)),
                  },
                  onValueChanged: (value) {},
                ),
              ),
              12.heightBox,
              12.heightBox,
              // TO DO
              //bu normalde obx ile sarılıyor fakat bende hata verdi.
              CustomButton(
                text: "Kayıt Ol",
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
      height: 100,
      width: 100,
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

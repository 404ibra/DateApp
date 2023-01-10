import 'package:date/Screens/Auth/Views/create_initial_profile%20_Step2_ui%20.dart';
import 'package:date/Screens/Auth/Views/create_initial_profile%20_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:collection/collection.dart';
import '../Components/custom_text_input.dart';

class CreateProfileStep2Screen extends StatelessWidget {
  CreateProfileStep2Screen(
      {super.key,
      required this.pickedImagefile,
      required this.isProfileVisible,
      required this.enteredName}) {}

  final bool isProfileVisible;
  final String enteredName;
  final ImagePicker _picker = ImagePicker();
  String pickedImagefile;
// TO DO
  void completeRegister() async {
    //
  }

  @override
  Widget build(BuildContext context) {
    return mainbuild(context);
  }
}

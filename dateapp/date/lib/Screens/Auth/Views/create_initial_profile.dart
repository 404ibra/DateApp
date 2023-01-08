import 'package:date/Screens/Auth/Views/create_initial_profile%20_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Components/custom_text_input.dart';

class CreateInitialProfileScreen extends StatelessWidget {
  CreateInitialProfileScreen({super.key}) {
    name.textChanged = (p0) => enteredName.value = p0;
  }

  final isProfileHidden = false.obs;
  final RxString enteredName = RxString("");
  final ImagePicker _picker = ImagePicker();
  Rx<String?> pickedImagefile = Rx(null);
  final name = CustomInput(hint: "İsminizi Yazın");
  String? entrcypedName(String name) {
    if (isProfileHidden.isFalse) {
      return name;
    }
    String enName = '';
    if (name.isEmpty) {
      return name;
    }
    final nameParts = name.split(" ");
    enName += nameParts[0].characters.first;
    enName += "*" * 2;
    return enName;
  }

// TO DO
  void completeRegister() async {
    //
  }

  Future<void> pickPhoto() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    pickedImagefile.value = pickedImage?.path;
  }

  @override
  Widget build(BuildContext context) {
    return mainbuild(context);
  }
}

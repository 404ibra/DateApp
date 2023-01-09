import 'package:date/Screens/Auth/Views/create_initial_profile%20_Step2_ui%20copy%202.dart';
import 'package:date/Screens/Auth/Views/create_initial_profile%20_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:collection/collection.dart';
import '../Components/custom_text_input.dart';

class CreateProfileStep2Screen extends StatelessWidget {
  CreateProfileStep2Screen({super.key}) {
    name.textChanged = (p0) => enteredName.value = p0;
  }

  final isProfileVisible = false.obs;
  final RxString enteredName = RxString("");
  final ImagePicker _picker = ImagePicker();
  Rx<String?> pickedImagefile = Rx(null);
  final name = CustomInput(hint: "İsminizi Yazın");

  String? entrcypedName(String name) {
    if (isProfileVisible.isTrue) {
      return name;
    }
    String enName = '';
    if (name.isEmpty) {
      return name;
    }
    final nameParts = name.split(" ");
    for (var currentNamePart in nameParts) {
      enName += (currentNamePart[0].characters.firstOrNull ?? "").toUpperCase();
      enName += "*" * (currentNamePart.length - 1);
      enName += " ";
    }
    enName = enName.trim();
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

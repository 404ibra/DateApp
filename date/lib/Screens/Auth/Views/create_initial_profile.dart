import 'package:date/Screens/Auth/Components/custom_snackbar.dart';
import 'package:date/Screens/Auth/Views/create_initial_profile%20_ui.dart';
import 'package:date/Screens/Auth/Views/create_initial_profile_Step2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:collection/collection.dart';

// local
import '../Components/custom_text_input.dart';

class CreateInitialProfileScreen extends StatelessWidget {
  CreateInitialProfileScreen({super.key}) {
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

  void gotoNextStep() {
    if (name.controller.text.length < 4) {
      CustomSnackBar.show("Hata", "Kullanıcı adı 4den daha fazla olmalı");
      return;
    }
    if ((pickedImagefile.value ?? "").isEmpty) {
      CustomSnackBar.show("Hata", "Lütfen bir fotoğraf koyudnuz");
      return;
    }
    Get.to(() => CreateProfileStep2Screen(
          enteredName: name.controller.text,
          isProfileVisible: isProfileVisible.value,
          pickedImagefile: pickedImagefile.value!,
        ));
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

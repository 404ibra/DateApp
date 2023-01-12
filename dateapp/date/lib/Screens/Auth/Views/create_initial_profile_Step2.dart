import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date/Constants/FireStore_Collections.dart';
import 'package:date/Models/UserModel.dart';
import 'package:date/Screens/Auth/Components/custom_snackbar.dart';
import 'package:date/Screens/Auth/Views/create_initial_profile%20_Step2_ui%20.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart'
    as ImageLocation; // as ImageLocation diyerek paketi bu şekilde çagiriyoruz image olarak cagirmiyoruz image.xxx olarak değil ImageLocation.xxx olarak yani...

class CreateProfileStep2Screen extends StatelessWidget {
  CreateProfileStep2Screen(
      {super.key,
      required this.pickedImagefile,
      required this.isProfileVisible,
      required this.fullName}) {}

  final isLoading = false.obs;
  final bool isProfileVisible;
  final String fullName;
  final ImagePicker _picker = ImagePicker();
  String pickedImagefile;
  RxString selectedgender = RxString("");
// TO DO

// buradan itibaren complete register başlıyor
  Future<void> completeRegister() async {
    if (selectedgender.isEmpty) {
      CustomSnackBar.show(
          "Bu alanı boş geçemezsinizç", "Sizi detaylıca tanımak istiyoruz");
    }
    isLoading.value = true;

//Step 2deki veriler ve önceki sayfadan gelen veriler ile UserModel oluşturma kısmı.

//image read and resize image and set new file name

    var image =
        ImageLocation.decodeJpg(File(pickedImagefile).readAsBytesSync())!;

    var thumbnail = ImageLocation.copyResize(image, width: 500);

// reesmin sonunaa -resized.jpeg ekliyorum fakat bu resmi encode etmedim daha
    var newFileName = pickedImagefile.replaceFirst(".jpg", "-resized.jped");

    File(newFileName)
        .writeAsBytesSync(ImageLocation.encodeJpg(thumbnail, quality: 80));

//kullanıcının resminin firebase storage yükleme kısmı
    final registeredUser = await FirebaseStorage.instance
        .ref("/profile-images")
        .child(
            "${FirebaseAuth.instance.currentUser!.uid}-${DateTime.now().millisecondsSinceEpoch}.jpg")
        .putFile(File(newFileName));

//resim image gibi alanları doldurma kodu burası
    final registerUser = UserModel(
        email: FirebaseAuth.instance.currentUser!.email,
        isProfileVisible:
            isProfileVisible, // onceki sayfadcan geldiği için isProfileVisible yazıyoruz
        gender: selectedgender
            .value, // bu sayfadan geeldiği için selectgender.value yazıyoruz..
        name: fullName,
        profileImageUrl: registeredUser.ref.fullPath);

    await FirebaseFirestore.instance
        .collection(FireStoreCollection.Users)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(registerUser.toJson());
    print("user created"); // test

    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return mainbuild(context);
  }
}

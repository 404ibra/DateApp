import 'package:get/get.dart';

//başarılı
class CustomSnackBar {
  static void show(title, text) {
    Get.closeAllSnackbars();
    Get.snackbar(title, text).show();
  }
}

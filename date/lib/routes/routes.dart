import 'package:date/Screens/Auth/Views/register_screen.dart';
import 'package:get/get.dart';

class Routes {
  static String loginScreen = "/loginnScreen";
  static String registerScreen = "/registerScreen";
}

final getPages = [
  GetPage(name: Routes.registerScreen, page: () =>  RegisterScreen(),)
];
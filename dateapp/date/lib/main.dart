import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/Auth/Views/LoginScreen.dart';
import 'Screens/Auth/Views/register_screen.dart';
import 'Screens/Auth/top_logo_sections.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
}
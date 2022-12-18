import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/CustomColors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.isTransParent = false, this.title = ""});

  final bool isTransParent;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
        elevation: 0,
        backgroundColor: isTransParent ? Colors.white : CustomColors.mainColor,
        foregroundColor: CustomColors.mainColor,
        title: title.text
            .color(isTransParent ? CustomColors.mainColor : Colors.white)
            .make());
  }

  @override
  Size get preferredSize => Size(double.maxFinite, kToolbarHeight);
}

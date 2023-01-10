import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage(
      {super.key, required this.isProfileVisible, required this.diskfilePath});

  final bool isProfileVisible;
  final String diskfilePath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 101,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipOval(
            child: Image.file(
              File(diskfilePath),
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
    ;
  }
}

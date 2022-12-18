import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key, this.isSmall = false});

  final bool isSmall;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      (isSmall ? 5 : 13).heightBox.safeArea(),
      [
        Image.asset(
          "assets/images/img_logo.png",
          height: isSmall ? 60 : 200,
          width: isSmall ? 100 : 200,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: "AnDate"
              .text
              .white
              .size(isSmall ? 25 : 40)
              .fontWeight(FontWeight.w100)
              .make(),
        )
      ]
          .stack(
           alignment:  Alignment.center
          )
          .pOnly(left: isSmall ? 22 : 44, bottom: isSmall ? 22 : 44).objectCenterRight(),
    ]);
    ;
  }
}

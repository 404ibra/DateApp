import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileVisibilityExplanantions extends StatelessWidget {
  const ProfileVisibilityExplanantions(
      {super.key, required this.isProfileVisible});

  final bool isProfileVisible;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(isProfileVisible
            ? Icons.visibility
            : Icons.visibility_off_outlined),
        const WidthBox(3),
        (isProfileVisible
                ? "İsminiz ve resminiz görülecektir."
                : "İsminiz ve resminiz gösterilmeyecektir.")
            .text
            .minFontSize(11)
            .size(13)
            .make(),
      ],
    );
  }
}

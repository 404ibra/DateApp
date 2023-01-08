import 'package:date/Constants/CustomColors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.text = "", required this.onTap, this.isLoading = false});

  final String text;
  final void Function() onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(CustomColors.mainColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            onPressed: onTap,
            child: isLoading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(text,
                    style: const TextStyle(fontSize: 20, color: Colors.white))),
      ),
    );
  }
}

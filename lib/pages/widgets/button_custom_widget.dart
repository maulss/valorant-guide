import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';

class ButtomCustomWidget extends StatelessWidget {
  const ButtomCustomWidget({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: ColorConstant.red,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: FontStyleConstant.bowlbyOneSCDescription,
        ),
      ),
    );
  }
}

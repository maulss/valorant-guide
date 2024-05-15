import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';

class IconContainer extends StatelessWidget {
  const IconContainer(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.onTap});
  final String imagePath;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 2, color: ColorConstant.white)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 35,
              width: 75,
              child: Text(
                title,
                style: FontStyleConstant.bowlbyOneSCDescription.copyWith(
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';

class BannerContainer extends StatelessWidget {
  const BannerContainer(
      {super.key,
      required this.titleBanner,
      required this.subtitleBanner,
      required this.pathImage,
      required this.offset,
      this.height});
  final String titleBanner;
  final String subtitleBanner;
  final String pathImage;
  final Offset offset;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(0, 15),
            child: Container(
              height: 170,
              width: 370,
              decoration: BoxDecoration(
                  color: ColorConstant.red,
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          Transform.translate(
            offset: offset,
            child: Image.asset(
              pathImage,
              height: height,
            ),
          ),
          Transform.translate(
            offset: const Offset(15, 20),
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 240,
              child: Text(
                titleBanner,
                style: FontStyleConstant.bowlbyOneSCTitlePage
                    .copyWith(fontSize: 23, color: ColorConstant.black),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(15, 70),
            child: Container(
              alignment: Alignment.topLeft,
              height: 100,
              width: 240,
              child: Text(
                subtitleBanner,
                style: FontStyleConstant.bowlbyOneSCTitlePage
                    .copyWith(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}

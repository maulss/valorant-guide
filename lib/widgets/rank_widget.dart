import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';
import 'package:valorant_documentation/constant/font_style_constant.dart';

class RankWidget extends StatelessWidget {
  const RankWidget(
      {super.key,
      required this.rankTitle,
      required this.tier1,
      required this.tier2,
      required this.tier3,
      required this.tierName1,
      required this.tierName2,
      required this.tierName3});

  final String rankTitle;
  final String tier1;
  final String tier2;
  final String tier3;
  final String tierName1;
  final String tierName2;
  final String tierName3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          rankTitle,
          style: FontStyleConstant.bowlbyOneSCTitlePage,
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorConstant.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Transform.translate(
                offset: Offset(0, 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      child: Image.network(
                        tier1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      child: Image.network(
                        tier2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      child: Image.network(
                        tier3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 110,
                      child: Text(
                        tierName1,
                        style: FontStyleConstant.bowlbyOneSCDescription
                            .copyWith(fontSize: 13),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 110,
                      child: Text(
                        tierName2,
                        style: FontStyleConstant.bowlbyOneSCDescription
                            .copyWith(fontSize: 13),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 110,
                      child: Text(
                        tierName3,
                        style: FontStyleConstant.bowlbyOneSCDescription
                            .copyWith(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';

class PlayerCardsPage extends StatelessWidget {
  const PlayerCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Player cards",
        ),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(5),
            height: 500,
            color: ColorConstant.red,
          );
        },
      ),
    );
  }
}

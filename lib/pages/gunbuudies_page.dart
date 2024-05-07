import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';

class GunBuddiesPage extends StatelessWidget {
  const GunBuddiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gunbuddies"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration:
                  BoxDecoration(border: Border.all(color: ColorConstant.red)),
              margin: const EdgeInsets.all(5),
              child: Image.asset('assets/images/display_gunbuddies.png'),
            );
          },
        ),
      ),
    );
  }
}

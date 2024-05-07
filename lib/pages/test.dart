import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          color: ColorConstant.white,
          padding: EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Positioned(
                child: Transform.translate(
                  offset: const Offset(170, -50),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

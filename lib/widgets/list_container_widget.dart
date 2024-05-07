import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({super.key, this.child, this.border});
  final BoxBorder? border;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorConstant.red,
          border: border,
        ),
        child: child);
  }
}

import 'package:flutter/material.dart';
import 'package:valorant_documentation/constant/color_constant.dart';

import '../constant/font_style_constant.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    this.onChanged,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.prefixIconColor,
  });

  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Color? prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      style: FontStyleConstant.bowlbyOneSCDescription
          .copyWith(fontSize: 12, color: ColorConstant.red),
      cursorColor: ColorConstant.red,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstant.red),
        ),
        hintStyle: FontStyleConstant.bowlbyOneSCDescription
            .copyWith(color: ColorConstant.red, fontSize: 13),
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        filled: true,
        fillColor: ColorConstant.white,
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        labelStyle: FontStyleConstant.bowlbyOneSCDescription
            .copyWith(fontSize: 12, color: ColorConstant.red),
      ),
    );
  }
}

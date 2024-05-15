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
    this.obscureText = false,
    this.suffixIcon,
    this.errorText,
  });

  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      style: FontStyleConstant.bowlbyOneSCDescription
          .copyWith(fontSize: 12, color: ColorConstant.red),
      cursorColor: ColorConstant.red,
      controller: controller,
      decoration: InputDecoration(
        errorStyle: FontStyleConstant.bowlbyOneSCDescription.copyWith(
          color: ColorConstant.white,
          fontSize: 9,
        ),
        errorText: errorText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstant.red),
        ),
        hintStyle: FontStyleConstant.bowlbyOneSCDescription
            .copyWith(color: ColorConstant.red, fontSize: 13),
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIcon: suffixIcon,
        suffixIconColor: ColorConstant.red,
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

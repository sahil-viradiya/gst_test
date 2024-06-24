import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final Color? textColor;
  final Color? boxColor;
  final FormFieldValidator? validator;
  final TextInputType? keyboardType;


  CustomTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.textColor,
    this.boxColor, this.validator, this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      obscureText: obscureText ?? false,
      controller: controller,
      cursorColor: Colors.black,
      keyboardType:keyboardType,
      style: TextStyle(fontSize: 13, color: textColor ?? Colors.black),
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 13),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 13, color: boxColor ?? Colors.black),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: boxColor ?? Colors.black, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: boxColor ?? Colors.black, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: boxColor ?? Colors.black, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: boxColor ?? Colors.black, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: boxColor ?? Colors.black, width: 1.5),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  String? hintText;
  bool obscureText;
  TextInputType? textInputType;
  TextEditingController? controller;
  TextFormFieldWidget(
    {
      Key? key, 
      this.hintText, 
      this.textInputType,
      this.obscureText = false,
      this.controller
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
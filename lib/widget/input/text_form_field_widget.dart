import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  String? hintText;
  bool obscureText, enabled;
  TextInputType? textInputType;
  TextEditingController? controller;
  TextFormFieldWidget(
    {
      Key? key, 
      this.hintText, 
      this.textInputType,
      this.obscureText = false,
      this.enabled = true,
      this.controller
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscureText,
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Form harus diisi.';
        }
        return null;
      },
    );
  }
}
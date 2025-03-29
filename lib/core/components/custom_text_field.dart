import 'package:flutter/material.dart';

class CustomTextField {
  static TextFormField buildTextFormField({
    String? labelText,
    String? hintText,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    VoidCallback? onTap,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool obscureText = false,
    Color? borderColor,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    int maxLines = 1,
    double radius = 4,
    bool? enabled,
    bool readOnly = false,
    String? initialValue,
    TextEditingController? controller,
  }) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      initialValue: initialValue,
      maxLines: maxLines,
      onChanged: onChanged,
      onTap: onTap,
      obscureText: obscureText,
      style: textStyle,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintText: hintText,
        hintStyle: hintStyle,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: borderColor ?? Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: borderColor ?? Colors.white,
            width: 2.0,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
      validator: validator,
    );
  }
}

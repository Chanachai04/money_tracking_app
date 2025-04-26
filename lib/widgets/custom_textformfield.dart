import 'package:flutter/material.dart';
import 'package:money_tracking_app/constants/color_constant.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData? iconSuffix;
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final Key fieldKey;
  final String validateText;
  bool obscureText;
  CustomTextFormField({
    super.key,
    this.iconSuffix,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    required this.fieldKey,
    required this.validateText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: widget.obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon:
            widget.iconSuffix != null
                ? IconButton(
                  icon:
                      widget.obscureText
                          ? Icon(widget.iconSuffix)
                          : Icon(Icons.lock_open),
                  onPressed: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                )
                : null,
        suffixIconColor: Colors.grey,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Colors.black),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(mainColor), width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(mainColor), width: 2.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.validateText;
        }
        return null;
      },
    );
  }
}

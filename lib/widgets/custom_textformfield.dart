import 'package:flutter/material.dart';
import 'package:money_tracking_app/constants/color_constant.dart';

// ignore: must_be_immutable
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
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.fieldKey,
    required this.validateText,
    this.iconSuffix,
    this.obscureText = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  DateTime? selectedDate;

  // ฟังก์ชัน pickDate เพื่อเลือกวันที่
  Future<void> pickDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(1925);
    final lastDate = DateTime(2026);

    DateTime initialDate = selectedDate ?? now;

    if (initialDate.isAfter(lastDate)) {
      initialDate = lastDate;
    }

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    String formatDate(DateTime date) {
      return "${date.day}-${date.month}-${date.year}";
    }

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        widget.controller.text = formatDate(
          picked,
        ); // อัพเดต TextFormField ด้วยวันที่ที่เลือก
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            pickDate(); // เปิดเลือกวันที่เมื่อกดที่ TextFormField
          },
          child: TextFormField(
            key: widget.fieldKey,
            obscureText: widget.obscureText,
            controller: widget.controller,
            decoration: InputDecoration(
              suffixIcon: buildSuffixIcon(),
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
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget? buildSuffixIcon() {
    if (widget.iconSuffix != null && widget.iconSuffix == Icons.lock) {
      return IconButton(
        icon:
            widget.obscureText
                ? Icon(widget.iconSuffix)
                : Icon(Icons.lock_open),
        onPressed: () {
          setState(() {
            widget.obscureText = !widget.obscureText;
          });
        },
      );
    } else {
      return IconButton(
        icon: Icon(widget.iconSuffix),
        onPressed: () {
          pickDate(); // เมื่อกดที่ไอคอนปฏิทินก็เลือกวันที่ได้เช่นกัน
        },
      );
    }
  }
}

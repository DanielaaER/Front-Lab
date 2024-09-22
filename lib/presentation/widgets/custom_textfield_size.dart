import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';


class CustomTextFieldSize extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final double width;

  const CustomTextFieldSize({
    required this.labelText,
    required this.controller,
    required this.width,
  }); // Constructor

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      // width: 600,
      height: 45,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          // prefixText: labelText,
          hintText: labelText,

          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: AppTheme.neutral200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: AppTheme.secondary),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: AppTheme.neutral200),
          ),
        ),
      ),
    );
  }
}

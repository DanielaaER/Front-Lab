import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';


class CustomTextSize extends StatelessWidget {
  final String labelText;
  final double size;
  final double width;


  const CustomTextSize({
    required this.labelText, required this.size, required this.width,
  }); // Constructor

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        labelText,

        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: AppTheme.neutral700,
        ),
      ),
    );
  }
}

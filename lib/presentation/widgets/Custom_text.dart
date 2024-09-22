import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';


class CustomText extends StatelessWidget {
  final String labelText;

  const CustomText({
    required this.labelText,
  }); // Constructor

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Text(
        labelText,

        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppTheme.neutral700,
        ),
      ),
    );
  }
}

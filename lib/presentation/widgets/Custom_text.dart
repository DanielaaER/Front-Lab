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
      width: 200,
      child: Text(
        labelText,

        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppTheme.secondary,
        ),
      ),
    );
  }
}

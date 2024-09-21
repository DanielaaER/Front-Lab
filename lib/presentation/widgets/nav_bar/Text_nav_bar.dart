
import 'package:flutter/material.dart';

class TextNavBar extends StatelessWidget {
  final String text;
  final Color color;

  TextNavBar({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: color,
      ),
    );
  }
}

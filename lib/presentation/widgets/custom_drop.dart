import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';

class CustomDropdown extends StatelessWidget {
  final String labelText;
  final List<String> items;
  final TextEditingController controller;
  final double width;
  final Function(String?) onChanged;

  const CustomDropdown({
    required this.labelText,
    required this.items,
    required this.controller,
    required this.width,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 45,
      child: DropdownButtonFormField<String>(
        value: controller.text.isNotEmpty ? controller.text : null,
        decoration: InputDecoration(
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
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          controller.text = value!;
          onChanged(value);
        },
      ),
    );
  }
}

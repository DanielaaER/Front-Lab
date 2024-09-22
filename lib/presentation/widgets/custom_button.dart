import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';


class CustomButton extends StatelessWidget {
  final double width;
  final String text;
  final VoidCallback onPressed;
  final bool enabled;
  final bool loading;

  const CustomButton({
    required this.width,
    required this.text,
    required this.onPressed,
    required this.enabled,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          shadowColor: AppTheme.primary100,

        ),
        child: loading
            ? const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.baseWhite),
          ),
        )
            : Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: AppTheme.baseWhite,
          ),
        ),
      ),
    );
  }
}

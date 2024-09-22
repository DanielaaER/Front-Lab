import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';

void showAlert(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: AppTheme.error,
            ),
            // const SizedBox(width: 5),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppTheme.error,
              ),
            ),
          ],
        ),
        content: Text(
          message,
          style: const TextStyle(
            color: AppTheme.neutral400,
          ),
        ),
        backgroundColor:AppTheme.baseWhite,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppTheme.error, width: 3.0),

          borderRadius: BorderRadius.circular(10.0),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'OK',
              style: TextStyle(
                color: AppTheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
          ),
        ],
      );
    },
  );
}

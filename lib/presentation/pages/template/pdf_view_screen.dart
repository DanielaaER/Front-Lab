import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:printing/printing.dart';

import '../../themes/Theme.dart';

void PDFViewerDialog(BuildContext context, Uint8List pdfPath) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text('Vista previa del PDF'),
        content: Container(
          width: double.maxFinite,
          // height: 400,
          child: PdfPreview(
            build: (format) => pdfPath,
            canDebug: false,
            canChangeOrientation: false,
            canChangePageFormat: false,
            allowPrinting: false,
            allowSharing: false,
          ),
        ),
        backgroundColor: AppTheme.baseWhite,
        shadowColor: AppTheme.baseWhite,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cerrar'),
          ),
        ],
      );
    },
  );
}

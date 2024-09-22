import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

// Estilos de texto
pw.TextStyle headerTextStyle() => pw.TextStyle(
      fontSize: 13,
      fontWeight: pw.FontWeight.bold,
      color: PdfColor(0, 0.188, 0.286), // #003049
    );

pw.TextStyle subheaderTextStyle() => pw.TextStyle(
      fontSize: 11,
      fontWeight: pw.FontWeight.bold,
      color: PdfColor(0, 0.188, 0.286), // #003049
    );

pw.TextStyle analysisHeaderTextStyle() => pw.TextStyle(
      fontSize: 11,
      fontWeight: pw.FontWeight.bold,
      color: PdfColor(0, 0.188, 0.286), // #003049
    );

pw.TextStyle bodyTextStyle(
        {bool bold = false, PdfColor color = PdfColors.black}) =>
    pw.TextStyle(
      fontSize: 12,
      fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
      color: color,
    );

pw.TextStyle resultTextStyle(int result) => pw.TextStyle(
      fontSize: 12,
      fontWeight: pw.FontWeight.bold,
      color: result == 0 ? PdfColors.green : PdfColors.red,
    );

pw.TextStyle patientInfoTextStyle() => pw.TextStyle(
      fontSize: 12,
      color: PdfColors.black,
    );

pw.TextStyle sectionInfoTextStyle() => pw.TextStyle(
      fontSize: 11,
      fontWeight: pw.FontWeight.bold,
      color: PdfColors.black,
    );

pw.TextStyle testInfoTextStyle() => pw.TextStyle(
      fontSize: 11,
      color: PdfColors.black,
    );

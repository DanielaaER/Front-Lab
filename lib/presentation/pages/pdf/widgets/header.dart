import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../style/pdf_styles.dart';


pw.Widget buildHeader(String title) {
  return pw.Text(
    title,
    style: headerTextStyle(),
  );
}

pw.Widget buildPatientInfo(String title) {
  return pw.Text(
    title,
    style: patientInfoTextStyle(),
  );
}

pw.Widget buildSectionInfo(String title) {
  return pw.Text(
    title,
    style: sectionInfoTextStyle(),
  );
}

pw.Widget buildTestInfo(String title) {
  return pw.Text(
    title,
    style: testInfoTextStyle(),
  );
}

pw.Widget buildSubheader(String title) {
  return pw.Text(
    title,
    style: subheaderTextStyle(),
  );
}

pw.Widget buildAnalysisHeader(String title) {
  return pw.Text(
    title,
    style: analysisHeaderTextStyle(),
  );
}

pw.Widget buildTestResult(Map<String, dynamic> test) {
  return pw.Container(
    margin: pw.EdgeInsets.only(bottom: 10),
    padding: pw.EdgeInsets.all(8),
    decoration: pw.BoxDecoration(
      color: PdfColors.white,
      border: pw.Border.all(color: PdfColors.grey700),
      borderRadius: pw.BorderRadius.circular(4),
    ),
    child: pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          flex: 2,
          child: pw.Text('Prueba: ${test['test']['name']}',
              style: bodyTextStyle()),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Text(
            'Resultado: ${test['result']['result'] == 0 ? 'NEGATIVO' : 'POSITIVO'}',
            style: resultTextStyle(test['result']['result']),
          ),
        ),
        pw.Expanded(
          flex: 2,
          child: pw.Text('Referencia: ${test['references'][0]['value']}',
              style: bodyTextStyle()),
        ),
      ],
    ),
  );
}

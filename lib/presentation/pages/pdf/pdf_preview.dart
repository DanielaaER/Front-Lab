import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'generate_pdf.dart';
import 'widgets/header.dart';

pw.Widget buildTestResult(Map<String, dynamic> test) {
  print("test");
  print(test);
  return pw.Container(
      child: pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          mainAxisAlignment: pw.MainAxisAlignment.start,
          children: [

            pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  if (test['test']['name'] != "")
                    pw.Container(
                        width: PdfPageFormat.letter.width * .3,
                        child: buildTestInfo('${test['test']['name']}')),
                  if (test['test']['method'] != "")
                    pw.Container(
                        width: PdfPageFormat.letter.width * .3,
                        child: buildTestInfo('Metodo: ${test['test']['method']}')),
                  if (test['test']['sample'] != "")
                    pw.Container(
                        width: PdfPageFormat.letter.width * .3,
                        child: buildTestInfo('Prueba: ${test['test']['sample']}')),
                ]),


            pw.Container(
                width: PdfPageFormat.letter.width * .3,
                child: buildTestInfo('${test['test']['result']}')),
            pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                if (test['references'] != null && test['references'].isNotEmpty) ...[
                  for (var reference in test['references']) ...[
                    if (reference['value'] != null && reference['value'] != "")
                      pw.Container(
                        width: PdfPageFormat.letter.width * .3,
                        child: buildSectionInfo('${reference['value']}'),
                      ),
                    if (reference['description'] != null && reference['description'] != "")
                      pw.Container(
                        width: PdfPageFormat.letter.width * .3,
                        child: buildTestInfo('Descripción: ${reference['description']}'),
                      ),
                    if (reference['unit'] != null && reference['unit'] != "")
                      pw.Container(
                        width: PdfPageFormat.letter.width * .3,
                        child: buildTestInfo('Unidades: ${reference['unit']}'),
                      ),
                  ],
                ],
              ],
            ),
          ]));
}


Future<Uint8List> previewPdf(Map<String, dynamic> jsonData) async {
  // Future<void> previewPdf(Map<String, dynamic> jsonData) async {
    final pdf = pw.Document();

  print("going to generate pdf");
  print(jsonData);

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Container(
          decoration: pw.BoxDecoration(color: PdfColors.white),
          width: PdfPageFormat.letter.width,
          height: PdfPageFormat.letter.height,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              buildHeader("Q.C. Maria del Rocio Soto Amaya"),
              buildHeader("UNIVERSIDAD VERACRUZANA"),
              buildHeader("CED. PROF. 5390670"),
              pw.SizedBox(height: 10),
              pw.Container(
                  width: PdfPageFormat.letter.width,
                  child: (pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        buildSubheader(
                            'Av. De los Héroes no. 3, Camarón de Tejeda, Ver. (Frente al Parque)'),
                        buildSubheader(
                            'Lunes a Viernes de 7:30 a 15:00 y Sábado de 7:30 a 14:00  Tel. 273 73 84365'),
                      ]))),
              pw.SizedBox(height: 20),
              pw.Container(
                  child: pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Container(
                          width: PdfPageFormat.letter.width * .15,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                buildPatientInfo("PACIENTE"),
                                buildPatientInfo("EDAD"),
                                buildPatientInfo("SEXO"),
                                buildPatientInfo("FECHA"),
                              ]),
                        ),
                        pw.Container(
                          width: PdfPageFormat.letter.width * .8,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                buildPatientInfo("nombre paciente"),
                                buildPatientInfo("edad paciente"),
                                buildPatientInfo(
                                    "sexo paciente"),
                                buildPatientInfo("${DateTime.now()}"),
                              ]),
                        ),
                      ])),
              pw.SizedBox(height: 10),
              pw.Container(
                width: PdfPageFormat.letter.width,
                color: PdfColors.blueGrey100,
                child: buildAnalysisHeader(
                    "Estudio Solicitado: ${jsonData['analysis']}"),
              ),
              pw.SizedBox(height: 20),
              pw.Container(
                  child: pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Container(
                          width: PdfPageFormat.letter.width * .3,
                          child: buildSectionInfo("Prueba"),
                        ),
                        pw.Container(
                          width: PdfPageFormat.letter.width * .3,
                          child: buildSectionInfo("Resultado"),
                        ),
                        pw.Container(
                          width: PdfPageFormat.letter.width * .3,
                          child: buildSectionInfo("Referencias"),
                        ),
                      ])),
              pw.SizedBox(height: 10),
              if (jsonData['sections'] != null &&
                  jsonData['sections'].isNotEmpty)
                for (var section in jsonData['sections']) ...[
                  pw.SizedBox(height: 10), // Espacio entre secciones o tests
                  pw.Column(
                    children: buildSectionResult(section),
                  ),

                  pw.SizedBox(height: 5), // Espacio entre secciones o tests
                  if (section['tests'] != null && section['tests'].isNotEmpty)
                    pw.Column(
                      children: section['tests'].map<pw.Widget>((test) {
                        return buildTestResult(
                            test); // Aquí generas el resultado de cada test
                      }).toList(),
                    )
                ],
              if (jsonData['comments'] != null &&
                  jsonData['comments'].isNotEmpty)
                pw.Column(children: [
                  pw.SizedBox(height: 20),
                  buildSectionInfo(
                      'Observaciones: ${jsonData['comments']}' ?? ''),
                ]),
              pw.Expanded(
                child: pw.Container(),
              ),
              pw.Container(
                alignment: pw.Alignment.bottomCenter,
                child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.SizedBox(height: 20),
                      buildSectionInfo(
                          'Responsable: Q.C. María del Rocío Soto Amaya'),
                      buildSectionInfo('Ced. Prof. 5390670'),
                    ]),
              ),
            ],
          ),
        );
      },
    ),
  );

    return pdf.save();


}
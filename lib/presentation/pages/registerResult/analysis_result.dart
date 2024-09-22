import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';
import 'package:front_laboratory/presentation/widgets/Custom_text_size.dart';
import 'package:front_laboratory/presentation/widgets/custom_button.dart';

import '../../widgets/Custom_text.dart';
import '../../widgets/custom_textfield_size.dart';
import '../pdf/generate_pdf.dart';
import '../pdf/pdf_preview.dart';
import '../template/pdf_view_screen.dart';

class AnalysisResultPage extends StatefulWidget {
  @override
  _AnalysisResultPage createState() => _AnalysisResultPage();
}

class _AnalysisResultPage extends State<AnalysisResultPage> {
  final Map<String, dynamic> jsonData = {
    "sections": [
      {
        "name": "nombre de la seccion",
        "method": "metodo de la seccion",
        "sample": "muestra de la seccion",
        "tests": [
          {
            "test": {
              "name": "nombre de 1 prueba",
              "method": "Opción 2",
              "sample": "Opción 2",
              "type": "positivo_negativo"
            },
            "result": {"type": "positivo_negativo", "result": 0},
            "references": [
              {
                "description": "referencia 1",
                "value": "valor 1",
                "unit": "Opción 1"
              },
              {
                "description": "referencia 1",
                "value": "valor 1",
                "unit": "Opción 1"
              }
            ]
          },
          {
            "test": {
              "name": "nombre de prueba 2",
              "method": "Opción 2",
              "sample": "Opción 2",
              "type": "positivo_negativo"
            },
            "result": {"type": "positivo_negativo", "result": 0},
            "references": [
              {
                "description": "referencia 1",
                "value": "valor 1",
                "unit": "Opción 1"
              }
            ]
          },
        ]
      },
      {
        "name": "nombre de la seccion dos",
        "method": "metodo de la seccion",
        "sample": "muestra de la seccion",
        "tests": [
          {
            "test": {
              "name": "nombre de prueba 3",
              "method": "Opción 2",
              "sample": "Opción 2",
              "type": "positivo_negativo"
            },
            "result": {"type": "positivo_negativo", "result": 0},
            "references": [
              {
                "description": "referencia 1",
                "value": "valor 1",
                "unit": "Opción 1"
              }
            ]
          },
        ]
      }
    ],
    "patient": {"name": "daniela", "age": 20, "gender": "mujer"},
    "comments": "",
    "analysis": "Biometria Hematica"
  };

  TextEditingController _studyRequestedController = TextEditingController();
  String comments = "";
  bool find = false;
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    jsonData['sections'].forEach((section) {
      section['tests'].forEach((test) {
        _controllers[test['test']['name']] = TextEditingController();
      });
    });
  }

  @override
  void dispose() {
    _controllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  Map<String, dynamic> _saveData() {
    jsonData['sections'].forEach((section) {
      section['tests'].forEach((test) {
        final key = test['test']['name'];
        if (_controllers.containsKey(key)) {
          test['result']['result'] = _controllers[key]?.text;
        }
      });
    });

    jsonData['comments'] = comments;
    return jsonData;
  }

  void _generatePDF() {
    _saveData();
    generatePdf(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child:
      Container(
        width: width * 0.8,
        padding: EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: AppTheme.baseWhite,
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 5,
          //     blurRadius: 7,
          //     offset: Offset(0, 3),
          //   ),
          // ],
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(labelText: "Estudio Solicitado"),
                  Container(
                    width: width * 0.5,
                    child: CustomText(labelText: jsonData['analysis']),
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomText(labelText: "Paciente: ${jsonData['patient']['name']}"),
              CustomText(labelText: "Edad: ${jsonData['patient']['age']}"),
              CustomText(labelText: "Sexo: ${jsonData['patient']['gender']}"),
              SizedBox(height: 10),

              Column(
                children: jsonData['sections'].map<Widget>((section) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: CustomTextSize(
                          labelText: section['name'],
                          size: 18,
                          width: 300,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomTextSize(
                            labelText: "Prueba",
                            size: 18,
                            width: MediaQuery.of(context).size.width * .2,
                          ),
                          CustomTextSize(
                            labelText: "Resultado",
                            size: 18,
                            width: MediaQuery.of(context).size.width * .2,
                          ),
                          CustomTextSize(
                            labelText: "Referencias",
                            size: 18,
                            width: MediaQuery.of(context).size.width * .2,
                          ),
                        ],
                      ),
                      ...section['tests'].map<Widget>((test) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomTextSize(
                                labelText: test['test']['name'],
                                size: 16,
                                width: MediaQuery.of(context).size.width * .2,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .2,
                                height: 45,
                                child: TextField(
                                  controller:
                                      _controllers[test['test']['name']],
                                  decoration: InputDecoration(
                                    hintText: "Resultado",
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                          color: AppTheme.neutral200),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide:
                                          BorderSide(color: AppTheme.secondary),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                          color: AppTheme.neutral200),
                                    ),
                                  ),
                                ),
                              ),
                              CustomTextSize(
                                labelText: ' ${test['references'][0]['unit']}',
                                size: 16,
                                width: MediaQuery.of(context).size.width * .2,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .80,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Comentarios',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      comments = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          width: 175,
          text: "Previsualizar",
          onPressed: () {
            _previewPdf();
          },
        ),
        CustomButton(width: 175, text: "Guardar", onPressed: _generatePDF),
      ],
    );
  }

  void _previewPdf() async {
    var jsonData = await _saveData();
    Uint8List pdfBytes = await previewPdf(jsonData);
    PDFViewerDialog(context, pdfBytes);
  }
}

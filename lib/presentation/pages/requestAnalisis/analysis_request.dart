import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';

import '../../widgets/nav_bar/nav_bar.dart';
import '../pdf/generate_pdf.dart';

class DynamicJsonPage extends StatefulWidget {
  @override
  _DynamicJsonPage createState() => _DynamicJsonPage();
}

class _DynamicJsonPage extends State<DynamicJsonPage> {
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
              }
            ]
          },
        ]
      },
      {
        "name": "nombre de la seccion dos",
        "method": "metodo de la seccion",
        "sample": "muestra de la seccion",
        "tests": []
      }
    ],
    "patient": {"name": "daniela", "age": 20, "gender": "mujer"},
    "comments": "",
    "analysis": "Biometria Hematica"
  };

  final Map<String, dynamic> updatedValues = {};

  String comments = "";

  void _saveData() {
    jsonData['sections'].forEach((section) {
      section['tests'].forEach((test) {
        final key = test['test']['name'];
        if (updatedValues.containsKey(key)) {
          test['result']['result'] = updatedValues[key];
        }
      });
    });

    jsonData['comments'] = comments;

    print("json data");
    print(jsonData);
  }

  void _generatePDF() {
    _saveData();
    generatePdf(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(title: 'Inicio'),
backgroundColor: AppTheme.baseWhite,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: jsonData['sections'].map<Widget>((section) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        section['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .25,
                          child: Text(
                            "Prueba",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .25,
                          child: Text(
                            "Resultado",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .25,
                          child: Text(
                            "Referencia",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.teal,
                            ),
                          ),
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
                            Container(
                              width: MediaQuery.of(context).size.width * .25,
                              child: Text(
                                test['test']['name'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            // Campo de texto para editar el resultado
                            Container(
                              width: MediaQuery.of(context).size.width * .25,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Resultado',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    updatedValues[test['test']['name']] = value;
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .25,
                              child: Text(
                                ' ${test['references'][0]['unit']}',
                                style: TextStyle(fontSize: 12),
                              ),
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
            ElevatedButton(
              onPressed: _saveData,
              child: Text('Guardar'),
            ),
            ElevatedButton(
              onPressed: _generatePDF,
              child: Text('Generar PDF'),
            ),
          ],
        ),
      ),
    );
  }
}

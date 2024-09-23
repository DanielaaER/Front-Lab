import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front_laboratory/presentation/pages/patients/widgets/add_patient.dart';
import 'package:front_laboratory/presentation/pages/patients/widgets/edit_patient.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';
import 'package:front_laboratory/presentation/widgets/Custom_text_size.dart';
import 'package:front_laboratory/presentation/widgets/custom_button.dart';

import '../../widgets/Custom_text.dart';
import '../../widgets/custom_textfield_size.dart';
import '../../widgets/data_table.dart';
import '../../widgets/nav_bar/nav_bar.dart';

class PatientsPage extends StatefulWidget {
  @override
  _PatientsPageState createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  final Map<String, dynamic> jsonData = {
    "headers": [
      "ID",
      "Nombre",
      "Fecha de Nacimiento",
      "Ciudad",
      "Teléfono",
      "Fecha de Registro"
    ],
    "rows": [
      ["P001", "Juan Pérez", "12/03/1980", "Orizaba", "555-1234", "01/09/2024"],
      [
        "P002",
        "María Gómez",
        "08/11/1972",
        "Veracruz",
        "555-5678",
        "12/08/2024"
      ],
      [
        "P003",
        "Carlos Ramírez",
        "15/07/1964",
        "Xalapa",
        "555-9876",
        "21/07/2024"
      ],
    ]
  };

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: NavBar(title: 'Pacientes'),
      backgroundColor: AppTheme.neutral100,
      body: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.fromLTRB(
            width * 0.1, height * .05, width * 0.1, height * .04),
        padding: EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: AppTheme.baseWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextSize(
                    labelText: "Pacientes",
                    size: 24,
                    width: 200,
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                      width: 200,
                      text: "Añadir Paciente",
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AddPatient();
                          },
                        );
                      }),
                ],
              ),
              SizedBox(height: 20),
              DataTableWidget(
                jsonData: jsonData,
                onEdit: (rowIndex) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return EditPatient(
                            patientIndex: rowIndex, jsonData: jsonData);
                      });
                },
                onDelete: (rowIndex) {},
                onView: (rowIndex) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

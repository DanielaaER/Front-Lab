import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front_laboratory/presentation/pages/patients/widgets/add_patient.dart';
import 'package:front_laboratory/presentation/pages/patients/widgets/edit_patient.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';
import 'package:front_laboratory/presentation/widgets/Custom_text_size.dart';
import 'package:front_laboratory/presentation/widgets/custom_button.dart';

import '../../../server/api_service.dart';
import '../../widgets/Custom_text.dart';
import '../../widgets/custom_textfield_size.dart';
import '../../widgets/data_table.dart';
import '../../widgets/nav_bar/nav_bar.dart';

class AnalysisRequestPage extends StatefulWidget {
  @override
  _AnalysisRequestPageState createState() => _AnalysisRequestPageState();
}

class _AnalysisRequestPageState extends State<AnalysisRequestPage> {
  late Map<String, dynamic> jsonData = {};
  bool loading = true;

  @override
  void initState() {
    super.initState();
    get_jsonData();
    print("jsonData: $jsonData");
  }

  Future<void> get_jsonData() async {
    try {
      jsonData = await ApiService()
          .getAnalysisRequest();
    } catch (e) {
      print("Error al obtener datos: $e");
      jsonData = {
        "headers": [
          "ID",
          "Email",
          "Teléfono",
          "Tipo de Paciente",
          "Fecha",
          "Total",
          "Pagado"
        ],
        "rows": [] // Inicializa con una lista vacía si hay un error
      };
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // get_jsonData();
    if (loading) {
      return Scaffold(
        appBar: NavBar(title: 'Solicitudes de Análisis'),
        backgroundColor: AppTheme.neutral100,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: NavBar(title: 'Solicitudes de Análisis'),
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
                    labelText: "Solictudes de Análisis",
                    size: 24,
                    width: 250,
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                      width: 200,
                      text: "Añadir Solicitud",
                      onPressed: () {
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return AddPatient();
                        //   },
                        // );
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

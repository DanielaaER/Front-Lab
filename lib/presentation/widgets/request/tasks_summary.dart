import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/pages/patients/widgets/add_patient.dart';
import 'package:front_laboratory/presentation/pages/requestAnalisis/analysis_request.dart';
import 'package:front_laboratory/presentation/widgets/Custom_text.dart';
import '../../themes/Theme.dart';
import 'task_item.dart';
import 'section_title.dart';

class TasksSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.55,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(labelText: "Atajos Rapidos"),

          SizedBox(height: 10),
          TaskItem(
              title: 'Solicitar Análisis',
              icon: Icon(Icons.analytics_outlined),
              onPress: (int index) {}),
          SizedBox(height: 10),
          TaskItem(
              title: 'Registrar Cliente',
              icon: Icon(Icons.person),
              onPress: (int index) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddPatient();
                    });
              }),
          SizedBox(height: 10),
          TaskItem(
              title: 'Registrar Pago',
              icon: Icon(Icons.payments),
              onPress: (int index) {}),
          SizedBox(height: 10),

        ],
      ),
    );
  }
}

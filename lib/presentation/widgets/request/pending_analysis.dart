import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/themes/Theme.dart';
import 'package:front_laboratory/presentation/widgets/Custom_text.dart';
import 'package:front_laboratory/presentation/widgets/custom_button.dart';

import '../../pages/registerResult/analysis_result.dart';
import '../../pages/requestAnalisis/analysis_request.dart';
import '../Custom_text_normal.dart';

class PendingAnalysis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> analysisList = [
      {"name": "George Hill", "date": "18 March, 2023", "time": "09:00 PM"},
      {"name": "Jane Doe", "date": "18 March, 2023", "time": "09:00 PM"},
      {"name": "Maria Cruz", "date": "18 March, 2023", "time": "09:00 PM"},
      {"name": "John Lewis", "date": "18 March, 2023", "time": "09:00 PM"},
      {"name": "Peter Parker", "date": "18 March, 2023", "time": "09:00 PM"},
      {"name": "Greg Kaufman", "date": "18 March, 2023", "time": "09:00 PM"},
      {"name": "Miles Carter", "date": "18 March, 2023", "time": "09:00 PM"},
      {"name": "Amy Adams", "date": "18 March, 2023", "time": "09:00 PM"},
      {"name": "John Johnson", "date": "18 March, 2023", "time": "09:00 PM"},
    ];

    var width = MediaQuery.of(context).size.width;
var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.7,
        width: width * 0.7,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(labelText: 'Análisis Pendientes'),
              SizedBox(height: 10),
              ...analysisList.map((analysis) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        // backgroundImage: AssetImage('assets/user_avatar.png'),
                        backgroundColor: AppTheme.primary100,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextNormal(labelText: analysis['name']!),
                            Text('${analysis['date']} | ${analysis['time']}'),
                          ],
                        ),
                      ),
                      CustomButton(
                        width: 200,
                        text: "Registrar resultados",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AnalysisResultPage(); // Llama a la ventana flotante de otra página
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ));
  }
}

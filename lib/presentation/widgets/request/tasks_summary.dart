import 'package:flutter/material.dart';
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
          CustomText(labelText: "Tareas del Día"),

          SizedBox(height: 10),
          TaskItem(title: 'Ir a tomar muestra', time: '11:30 AM'),
          SizedBox(height: 10),
          TaskItem(title: 'Entregar resultados a user', time: '11:30 AM'),
          SizedBox(height: 10),
          TaskItem(title: 'Revisar resultados de user', time: '11:30 AM'),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'View All',
              style: TextStyle(
                color: AppTheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

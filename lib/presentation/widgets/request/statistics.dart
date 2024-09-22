import 'package:flutter/material.dart';
import 'package:front_laboratory/presentation/widgets/Custom_text.dart';

class Statistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .55,
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
          CustomText(labelText: "Estadísticas"),
          SizedBox(height: 10),
          Container(
            height: 150,
            // Aquí podrías integrar un gráfico de línea usando una librería como fl_chart
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}

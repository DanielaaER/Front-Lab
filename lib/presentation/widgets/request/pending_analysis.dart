import 'package:flutter/material.dart';

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

    return Container(
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
          Text(
            'Análisis Pendientes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ...analysisList.map((analysis) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/user_avatar.png'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          analysis['name']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('${analysis['date']} | ${analysis['time']}'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Registrar resultados'),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

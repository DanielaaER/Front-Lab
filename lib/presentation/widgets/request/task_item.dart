import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String time;

  TaskItem({required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.check_box_outline_blank, color: Colors.blue),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(time),
        ],
      ),
    );
  }
}

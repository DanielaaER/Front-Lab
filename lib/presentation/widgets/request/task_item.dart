import 'package:flutter/material.dart';
import '../../themes/Theme.dart';
import '../Custom_text_normal.dart';

class TaskItem extends StatefulWidget {
  final String title;
  final String time;

  TaskItem({required this.title, required this.time});

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.secondary, width: .5),
      ),
      child: Row(
        children: [
          Checkbox(
            value: value,
            checkColor: AppTheme.baseWhite,
            activeColor: AppTheme.primary,
            side: BorderSide(color: AppTheme.primary),
            onChanged: (bool? newValue) {
              setState(() {
                value = newValue!;
              });
            },
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppTheme.secondary,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

            child:Text(
              widget.time,
              style: TextStyle(
                fontSize: 17,
                // fontWeight: FontWeight.bold,
                color: AppTheme.secondary,
              ),
            ),
          )
        ],
      ),
    );
  }
}

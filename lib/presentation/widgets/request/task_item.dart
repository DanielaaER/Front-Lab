import 'package:flutter/material.dart';
import '../../themes/Theme.dart';
import '../Custom_text_normal.dart';

class TaskItem extends StatefulWidget {
  final String title;
  final Icon icon;
  final Function(int) onPress;

  TaskItem({required this.title, required this.icon, required this.onPress});

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppTheme.secondary, width: .5),
        ),
        child: GestureDetector(
          onTap: () {
            widget.onPress(1);
          },
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  widget.icon.icon,
                  color: AppTheme.baseWhite,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:clear/model/reminder.dart';
import 'package:flutter/material.dart';

class RemindersListTile extends StatelessWidget {
  final Color tileColor;
  final Reminder reminder;

  const RemindersListTile({
    Key? key,
    required this.reminder,
    required this.tileColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: reminder.isDone ? Colors.black87 : tileColor,
      key: reminder.key,
      title: Text(
        reminder.title,
        style: TextStyle(
          fontSize: 24.0,
          color: reminder.isDone ? Colors.grey.shade700 : Colors.white,
          decoration: reminder.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}

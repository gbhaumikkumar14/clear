import 'package:clear/model/data.dart';
import 'package:clear/model/reminder.dart';
import 'package:clear/uiComponents/reminders_list_tile.dart';
import 'package:flutter/material.dart';

class RemindersScreen extends StatefulWidget {
  static const id = 'reminders_screen';

  const RemindersScreen({Key? key}) : super(key: key);

  @override
  _RemindersScreenState createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  List<Reminder> _reminders = [];

  @override
  void initState() {
    super.initState();
    _reminders = getReminders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        // Reorderable List view has issue check below link
        // https://github.com/flutter/flutter/issues/21829
        // Change below widget to reproduce 'Multiple widgets used the same GlobalKey.'
        child: ListView.builder(
          itemCount: _reminders.length,
          itemBuilder: (context, index) {
            final reminder = _reminders[index];
            print('Key at $index is ${reminder.key}');
            return Dismissible(
              key: reminder.key,
              background: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.0),
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
                color: Colors.green,
              ),
              secondaryBackground: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direction) {
                print('Swiped direction $direction');
                if (direction == DismissDirection.startToEnd) {
                  // Swiped right
                  setState(() {
                    Reminder completed = _reminders.removeAt(index);
                    completed.isDone = true;
                    _reminders.add(completed);
                  });
                } else {
                  // Swiped left

                  setState(() {
                    _reminders.removeAt(index);
                  });
                }
              },
              child: RemindersListTile(
                reminder: reminder,
                tileColor: Color.fromRGBO(
                    255, (255 ~/ _reminders.length) * index, 0, 100.0),
              ),
            );
          },
          /*onReorder: (oldIndex, newIndex) {
            print('old index: $oldIndex new index: $newIndex');
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final Reminder movedItem = _reminders.removeAt(oldIndex);
              _reminders.insert(newIndex, movedItem);
            });
          },*/
        ),
      ),
    );
  }
}

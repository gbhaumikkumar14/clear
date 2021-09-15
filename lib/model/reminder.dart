
import 'package:clear/utils/global_counter.dart';
import 'package:flutter/cupertino.dart';

class Reminder{
  String title;
  double  timeStamp;
  bool isDone;
  final Key key = ValueKey(Counter().getUniqueNumber());

  Reminder({required this.title, required this.timeStamp, this.isDone = false});
}
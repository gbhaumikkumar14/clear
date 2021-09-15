import 'package:clear/model/reminder.dart';
import 'package:clear/utils/constants.dart';
import 'package:clear/model/page_model.dart';
import 'package:flutter/material.dart';

List<PageModel> getPageItems() {
  List<PageModel> slides = [
    //1/////////////////////////////////////////////////////////
    PageModel(
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Welcome to ',
              style: k28TextNormal,
            ),
            TextSpan(text: 'Clear \n', style: k900Bold28Text),
            TextSpan(text: 'Tap or swipe ', style: k500Bold20Text),
            TextSpan(
              text: 'to begin.',
              style: k20TextNormal,
            ),
          ],
        ),
      ),
    ),
    //2///////////////////////////////////////////////////////////////
    PageModel(
      image: 'images/mobile_1.png',
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Clear sorts items by ',
              style: k20TextNormal,
            ),
            TextSpan(
              text: 'priority',
              style: k500Bold20Text,
            ),
          ],
        ),
      ),
      desc: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Important items are highlighted\nat the top....',
          style: k20TextNormal,
        ),
      ),
    ),
    //3///////////////////////////////////////////////////////////////
    PageModel(
      image: 'images/mobile_1.png',
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Tap and hold ',
              style: k500Bold20Text,
            ),
            TextSpan(
              text: 'to pick and item up.',
              style: k20TextNormal,
            ),
          ],
        ),
      ),
      desc: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Drag it up or down to change its\npriority.',
              style: k20TextNormal,
            ),
          ],
        ),
      ),
    ),
    //4//////////////////////////////////////////////////////////////
    PageModel(
      image: 'images/mobile_1.png',
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'There are 3 navigation levels...',
          style: k20TextNormal,
        ),
      ),
    ),
    //5/////////////////////////////////////////////////////////////
    PageModel(
      image: 'images/mobile_1.png',
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Pinch together vertically ',
              style: k500Bold20Text,
            ),
            TextSpan(
              text: 'to\ncollapse your current level and navigate up.',
              style: k20TextNormal,
            ),
          ],
        ),
      ),
    ),
    //6////////////////////////////////////////////////////////////
    PageModel(
      image: 'images/mobile_1.png',
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Tap on a list ',
              style: k500Bold20Text,
            ),
            TextSpan(
              text: 'to see it content.\n',
              style: k20TextNormal,
            ),
            TextSpan(
              text: 'Tap on a list title ',
              style: k500Bold20Text,
            ),
            TextSpan(
              text: 'to edit it....',
              style: k20TextNormal,
            ),
          ],
        ),
      ),
    ),
  ];

  return slides;
}

List<Reminder> getReminders(){
  List<Reminder> reminders = [
    Reminder(title: 'Java interview',timeStamp: 1631619369),
    Reminder(title: 'Kotlin interview',timeStamp: 1631619469, isDone: true),
    Reminder(title: 'Flutter interview',timeStamp: 1631619569),
    Reminder(title: 'Python interview',timeStamp: 1631619769),
    Reminder(title: 'Magento interview',timeStamp: 1631619869),
    Reminder(title: 'Salesforce interview',timeStamp: 1631619969, isDone: true),
    Reminder(title: 'SAP interview',timeStamp: 1631620369),
    Reminder(title: 'ReactJs interview',timeStamp: 1631630369),
    Reminder(title: 'Machine learning interview',timeStamp: 1631630469, isDone: true),
    Reminder(title: 'Dot Net interview',timeStamp: 1631630569),
    Reminder(title: 'DevOps interview',timeStamp: 1631630669),
    Reminder(title: 'C/C++ interview',timeStamp: 1631630769),
    Reminder(title: 'NodeJs interview',timeStamp: 1631630869),
    Reminder(title: 'Angular interview',timeStamp: 1631630969),
  ];
  // Sorting by time stamp
  reminders.sort((a,b){
    var aTimeStamp = a.timeStamp;
    var bTimeStamp = b.timeStamp;
    return aTimeStamp.compareTo(bTimeStamp) & (a.isDone == true ? 1 : -1);
  });

  return reminders;
}
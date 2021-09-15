import 'package:clear/screens/reminders_screen.dart';
import 'package:clear/screens/welcome_screen.dart';
import 'package:clear/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ClearApp());
}

class ClearApp extends StatelessWidget {
  const ClearApp({Key? key}) : super(key: key);

  Future<bool> getFirstTimeFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kisFirstTime) ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<bool>(
        future: getFirstTimeFromSharedPref(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return WelcomeScreen();
          } else {
            return RemindersScreen();
          }
        },
      ),
    );
  }
}

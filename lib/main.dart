import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_test_first_app/pages/mainPage.dart';
import 'package:new_test_first_app/pages/quiz_Page.dart';
import 'package:new_test_first_app/pages/Scores.dart';
import 'package:new_test_first_app/pages/settingsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      initialRoute: '/',
      routes:{
        '/' :  (context) => MainPage(),
        '/quizPage' : (context) => QuizPage(),
        '/scoresPage' : (context) => ScoresPage(),
        '/settings' : (context) => SettingsPage(),
      },
    );
  }
}

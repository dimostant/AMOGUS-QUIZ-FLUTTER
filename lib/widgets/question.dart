import 'package:flutter/material.dart';
import 'package:new_test_first_app/data/GlobalData.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      //width: double.infinity,
      child: Text(
        questionText,
        style: TextStyle(fontSize: fontsize + 15),
        textAlign: TextAlign.center,
      ),
    );
  }
}

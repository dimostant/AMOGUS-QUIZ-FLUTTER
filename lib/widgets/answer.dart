import 'package:flutter/material.dart';
import '../GlobalData.dart';

class Answer extends StatelessWidget {
  final int answerNum;
  final Function(int) selectHandler;
  final String answerText;

  Answer(this.answerNum, this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        ),
        onPressed: () {
          selectHandler(answerNum);
        },
        child: Text(
          answerText,
          style: TextStyle(color: Colors.white, fontSize: fontsize + 5),
        ),
      ),
    );
  }
}

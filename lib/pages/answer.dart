import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.redAccent,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}

/*
child: ElevatedButton(
style: ButtonStyle(
backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
),
onPressed: () {
Navigator.pushNamed(context, '/quizPage');
},
child: Text(
'Play Quiz',
style: TextStyle(color: Colors.white),
),
)

child: ElevatedButton(
style: ButtonStyle(
backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
),
onPressed: () {
selectHandler;
},
child: Text(
answerText,
style: TextStyle (color: Colors.black),
),
),
);*/
import 'package:flutter/material.dart';
import 'questions.dart';
import 'question.dart';
import 'answer.dart';


class QuizPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<QuizPage> {

  var _questionIndex = 0;


  void _answerQuestion() {
    setState(() {
      _questionIndex = (_questionIndex + 1) % 6;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            title: Text("Amogus"),
            backgroundColor: Colors.redAccent
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,
            ),
            Container(
              height: 300,
              child: Question(
                  questions[_questionIndex]['questionText'] as String,
                ),
            ),
            Container(
               height: 210,
                child: Column(
                children : [
                  ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Answer(_answerQuestion, answer));
                }).toList(),
                ]
               ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Finish Quiz',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      );
  }
}
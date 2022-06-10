import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/questions.dart';
import '../Widgets/question.dart';
import '../Widgets/answer.dart';


class QuizPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<QuizPage> {

  var _questionIndex = 0;
  var _category = 'NotHere';
  String date = DateTime.now().toString().substring(0,10);
  String total = '00:00:00';//.substring(11,19) for Time

  bool isTimerOn = true;

  late Timer _timer;
  int _start = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = (_questionIndex + 1) % 6;
    });
    print(_questionIndex);
    print(date);
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      startTimer();
    });
    super.initState();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (isTimerOn == true) {
          setState(() {
            _start++;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
            SizedBox(
              height: 100,
            ),
            Container(
              height: 250,
              child: Question(
                  questions[_questionIndex]['questionText'] as String,
                ),
            ),
            Container (
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      SizedBox(
                        width: 60,
                      ),
                      Text(_start.toString(), textScaleFactor: 1.5),
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 30,
                        height:30,
                        child: FloatingActionButton(
                          backgroundColor: Colors.red,
                          child: Icon(isTimerOn
                              ? Icons.pause
                              : Icons.play_arrow
                          ), onPressed: () {
                            if (isTimerOn == 1){
                              setState(() {
                                isTimerOn == 0;
                              });
                            }
                            else {
                              setState(() {
                                isTimerOn == 1;
                                startTimer();
                              });
                            }
                        }
                        ),
                      ),
                    ],
                ),
              ),
            SizedBox(
              height: 30,
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
import 'package:flutter/material.dart';
import 'package:new_test_first_app/Widgets/ScoreCard.dart';
import '../classes/ScoreBoardContext.dart';
import '../data/GlobalData.dart';

class ScoresPage extends StatefulWidget {
  const ScoresPage({Key? key}) : super(key: key);

  @override
  State<ScoresPage> createState() => _ScoresPageState();
}

class _ScoresPageState extends State<ScoresPage> {

  ScoreBoardContext scoreBoardContext = new ScoreBoardContext(); //scores[0]; //To be fixed

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            title: Text('Scoreboard'),
            backgroundColor: Colors.redAccent,
          ),
          body: ScoreCard(scoreBoardContext),
        ),
      );
  }
}
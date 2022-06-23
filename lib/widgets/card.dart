import 'package:flutter/material.dart';
import '../classes/ScoreBoardContext.dart';

class ScoreCard extends StatelessWidget {
  final ScoreBoardContext scoreBoardContext;

  ScoreCard(this.scoreBoardContext);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.redAccent,
      margin: EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: 60,
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [
                Text('Score'),
                Text(scoreBoardContext.score.toString()),
              ])),
          Container(
              height: 60,
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [
                Text('Time'),
                Text(scoreBoardContext.time.toString() +
                    ' s'), //.substring(11,19)),
              ])),
          Container(
              height: 60,
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [
                Text('Date'),
                Text(scoreBoardContext.date.toString()), //.substring(0,10)),
              ])),
        ],
      ),
    );
  }
}

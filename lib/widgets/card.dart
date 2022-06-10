import 'package:flutter/material.dart';

class ScoreCard extends StatefulWidget {
  const ScoreCard({Key? key}) : super(key: key);

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {

  ScoreBoardContext scoreBoardContext = ScoreBoardContext(score: 5, date: DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.redAccent,
      margin: EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children : [
            Container(
              height: 60,
              padding: const EdgeInsets.all(12.0),
              child: Column(

                children: [
                  Text('Score'),
                  Text(scoreBoardContext.score.toString()),
                ]
              )
            ),
            Container(height: 60,
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  children: [
                    Text('Time'),
                    Text(scoreBoardContext.date.toString().substring(11,19)),
                  ]
              )
            ),
            Container(
                height: 60,
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  children: [
                    Text('Date'),
                    Text(scoreBoardContext.date.toString().substring(0,10)),
                  ]
              )
            ),
          ],
      ),
    );
  }
}


class ScoreBoardContext {

  int? score;
  String? date;

  ScoreBoardContext({this.score, this.date});

}

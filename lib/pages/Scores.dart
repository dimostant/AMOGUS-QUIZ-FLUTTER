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
  ScoreBoardContext scoreBoardContext = scores.isNotEmpty ? scores[0] : ScoreBoardContext(score: 0, date: 'N/A', time: '00:00');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Scoreboard'),
        backgroundColor: Colors.redAccent,
      ),
      body: scores.isNotEmpty
          ? ScoreCard(scoreBoardContext)
          : Center(
        child: Text(
          'No scores available',
          style: TextStyle(fontSize: fontsize, color: Colors.red),
        ),
      ),
    );
  }
}

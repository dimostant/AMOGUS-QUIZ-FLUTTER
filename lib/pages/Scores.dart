import 'package:flutter/material.dart';
import 'package:new_test_first_app/Widgets/card.dart';

class ScoresPage extends StatefulWidget {
  const ScoresPage({Key? key}) : super(key: key);

  @override
  State<ScoresPage> createState() => _ScoresPageState();
}

class _ScoresPageState extends State<ScoresPage> {

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
          body: ScoreCard(),
        ),
      );
  }
}
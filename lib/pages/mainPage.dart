import 'package:flutter/material.dart';
import 'package:new_test_first_app/pages/AssetsAudioPlayer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Image
                (
                image: AssetImage('assets/images/unnamed.png'),
              ),
            )
            ,
            Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () { },
                  child: Text(
                    'Choose Category',
                    style: TextStyle(color: Colors.white),
                  ),
                )
            ),
            Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
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
            ),
            Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/scoresPage');
                  },
                  child: Text(
                    'Scores',
                    style: TextStyle(color: Colors.white),
                  ),
                )
            ),
            assetsAudioPlayer()
          ],
        ),
      );
  }
}

      /*Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red,
          title: Center(
            child: Text('AMOGUS'),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                child: Image
                  (
                    image: AssetImage('assets/images/unnamed.png'),
                ),
              )
              ,
              Container(
                padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () { },
                  child: Text(
                      'Choose Category',
                      style: TextStyle(color: Colors.white),
                  ),
                )
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () { },
                    child: Text(
                      'Play Quiz',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () { },
                    child: Text(
                      'Scores',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
              )
            ],
          ),
        ),
      ),*/

import 'package:flutter/material.dart';
import 'package:new_test_first_app/pages/AssetsAudioPlayer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String dropdownValue = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Image
                    (
                    image: AssetImage('assets/images/unnamed.png'),
                  ),
                ),
                Container(
                    height: 50,
                    margin: EdgeInsets.fromLTRB(0, 7, 0, 7),
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
                    ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(65, 5, 65, 5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      DropdownButton<String>(
                        alignment: Alignment.center,
                        isExpanded: false,
                        dropdownColor: Colors.white,
                        value: dropdownValue,
                        items: <String>['Adult', 'Teen', 'Random', 'All']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            alignment: Alignment.center,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(65, 0, 65, 0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/scoresPage');
                      },
                      child: Text(
                        'Leaderboards',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(65, 0, 65, 0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      child: Text(
                        'Settings',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                ),
                assetsAudioPlayer()
              ],
            ),
          ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
//import 'AssetsAudioPlayer(Deprecated).dart';
import 'package:new_test_first_app/widgets/AssetsAudioPlayer(Deprecated).dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool username = false;
  String category = 'Beginner';

  @override
  Widget build(BuildContext context) {
    if (username) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: const Image(
                  image: AssetImage('assets/images/unnamed.png'),
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    WidgetStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/quizPage',arguments: category);
                  },
                  child: const Text(
                    'Play Quiz',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(65, 5, 65, 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Category',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    DropdownButton<String>(
                      alignment: Alignment.center,
                      isExpanded: false,
                      dropdownColor: Colors.white,
                      value: category,
                      items: <String>['Beginner', 'Expert'] //TODO:  , 'Random', 'All']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          alignment: Alignment.center,
                          child: Text(
                            value,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          category = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(65, 0, 65, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/scoresPage');
                    },
                    child: const Text(
                      'Leaderboards',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.fromLTRB(65, 0, 65, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                    child: const Text(
                      'Settings',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              if (username) const AssetsAudioPlayer(),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  WidgetStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    username = true;
                  });
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

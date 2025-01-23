import 'package:flutter/material.dart';
import '../data/GlobalData.dart';
import '../classes/Audio.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //var isplaying = true;
  String? newUsername = username;
  double newFont = fontsize;

  void audioState() {
    Audio.isBGMusicPlaying() ? Audio.pauseBgMusic() : Audio.playBgMusic();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            title: Text("Settings"),
            backgroundColor: Colors.redAccent),
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'Username',
                  style: TextStyle(fontSize: fontsize, color: Colors.redAccent),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: fontsize, color: Colors.red),
                      labelStyle:
                          TextStyle(fontSize: fontsize, color: Colors.red),
                      hintText: username,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    onChanged: (String value) async {
                      setState(() {
                        newUsername = value;
                      });
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Font size',
                style: TextStyle(fontSize: fontsize, color: Colors.redAccent),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: fontsize, color: Colors.red),
                      labelStyle:
                          TextStyle(fontSize: fontsize, color: Colors.red),
                      hintText: fontsize.toString(),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    onChanged: (String value) async {
                      setState(() {
                        newFont = double.parse(value);
                      });
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Audio.isBGMusicPlaying()
                        ? const Icon(
                            IconData(0xf0297, fontFamily: 'MaterialIcons'))
                        : const Icon(
                            IconData(0xf0299, fontFamily: 'MaterialIcons')),
                    onPressed: () {
                      audioState();
                      setState(() {
                        // playerChangeState();
                      });
                    },
                  ),
                  // if (Audio.isBGMusicPlaying() == true)
                  //   IconButton(
                  //     icon: const Icon(
                  //         IconData(0xf0297, fontFamily: 'MaterialIcons')),
                  //     onPressed: () {
                  //       print("pushed");
                  //       setState(() {
                  //         audioState();
                  //       });
                  //     },
                  //   )
                  // else
                  //   IconButton(
                  //     icon: const Icon(
                  //         IconData(0xf0299, fontFamily: 'MaterialIcons')),
                  //     onPressed: () {
                  //       setState(() {
                  //         // playerChangeState();
                  //       });
                  //     },
                  //   ),
                  SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () {
                      if (newFont > 25 || newFont < 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invalid Font Size')),
                        );
                      } else {
                        setState(() {
                          if (!(username == newUsername)) {
                            username = newUsername;
                            scores = [];
                          }
                          fontsize = newFont;
                        });
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: fontsize),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 50,
                color: Colors.redAccent,
              ),
              Text(
                'Sumbit Form',
                style: TextStyle(fontSize: fontsize, color: Colors.red),
              ),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Tell us your opinion!',
                  labelText: 'Feedback',
                  alignLabelWithHint: true,
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'This Feature is not available Yet, but we will be able to consider your consideration in the near future! Thanks for choosing us and helping us become better!')),
                    );
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

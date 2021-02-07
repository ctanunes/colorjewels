import 'package:color_jewels_app/screens/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:color_jewels_app/widgets/buttons/gradient.button.dart';
import 'package:color_jewels_app/widgets/detail/header.widget.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/route_manager.dart';
import 'package:color_jewels_app/models/language.model.dart';
import 'dart:async';
import 'dart:math';

import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../models/question.model.dart';

class GameScreen extends StatefulWidget {
  final Question question;

  const GameScreen({
    Key key,
    @required this.question,
  }) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeaderDetail(
                image: widget.question.image ?? "assets/images/detail.png",
                onBackPress: () {
                  Navigator.pop(context);
                },
              ),
              ContentDetail(
                question: widget.question.question ?? "Question",
                typeOf: widget.question.typeOf ?? "typeOf",
                answer: widget.question.answer,
                id: widget.question.id,
                answerText: widget.question.answerText,
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<bool> isSelected = [false, false, false];

class ContentDetail extends StatefulWidget {
  final String question;
  final Function onPress;
  final int answer;
  final String typeOf;
  final String answerText;
  final int id;

  const ContentDetail({
    Key key,
    @required this.question,
    this.onPress,
    this.answer,
    this.typeOf,
    this.id,
    this.answerText,
  }) : super(key: key);

  @override
  _ContentDetailState createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("answerText -" + this.widget.answerText);
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.widget.question,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.06,
            ),
          ),
          SizedBox(height: 25),
          option(this.widget.typeOf, size, this.widget.question),
          SizedBox(height: 25),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: GradientButton(
              onPress: () => {
                isItCorrect(this.widget.answer, this.widget.id,
                    this.widget.answerText, this.widget.typeOf)
              },
              text: "Confirm",
            ),
          ),
        ],
      ),
    );
  }

  Widget option(String option, Size size, [String question]) {
    if (option == "Option") {
      return StatefulBuilder(builder: (context, setState) {
        return ToggleButtons(
          children: <Widget>[
            Text("Yellow"),
            Text("Green"),
            Text("Red"),
          ],
          onPressed: (int index) {
            print(index);
            setState(() {
              for (int buttonIndex = 0;
                  buttonIndex < isSelected.length;
                  buttonIndex++) {
                if (buttonIndex == index) {
                  isSelected[buttonIndex] = true;
                } else {
                  isSelected[buttonIndex] = false;
                }
              }
              print(isSelected);
            });
          },
          isSelected: isSelected,
        );
      });
    } else if (option == "Sound") {
      return Container(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('Initialize'),
              onPressed: _hasSpeech ? null : initSpeechState,
            ),
            FlatButton(
              child: Text('Start'),
              onPressed:
                  !_hasSpeech || speech.isListening ? null : startListening,
            ),
            FlatButton(
              child: Text('Stop'),
              onPressed: speech.isListening ? stopListening : null,
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: speech.isListening ? cancelListening : null,
            ),
            Container(
              color: Theme.of(context).selectedRowColor,
              child: Center(
                child: Text(
                  lastWords,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned.fill(
              bottom: 10,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: .26,
                          spreadRadius: level * 1.5,
                          color: Colors.black.withOpacity(.05))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: () => null,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Text(
        "Something",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: size.width * 0.05,
          color: Colors.green[700].withOpacity(0.8),
        ),
      );
    }
  }

  FlutterTts flutterTts = FlutterTts();
  Future _speak() async{
    await flutterTts.speak("Good job! You got the English jewel");
  }

  Future _speakCorrect() async{
    await flutterTts.speak("Your answer is correct");
  }

  Future _speakNotCorrect() async{
    await flutterTts.speak("Sorry try again");
  }

  Future _speakQuestion(question) async{
    await flutterTts.speak(question);
  }

  isCorrectPopUp(id) {
    if (id == 4) {
      _speak();
      return showDialog(
        context: context,
        child: AlertDialog(
          content: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [

                Text(
                  "Good job! You got the English jewel",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: GradientButton(
                    text: "Try to get some more jewels",
                    onPress: () {
                      Get.to(HomeScreen());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      _speakCorrect();
      return showDialog(
        context: context,
        child: AlertDialog(
          content: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Your answer is correct",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: GradientButton(
                      text: "Confirm",
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return GameScreen(
                                question: eng[id],
                              );
                            },
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  notCorrectPopup() {
    _speakNotCorrect();
    return showDialog(
      context: context,
      child: AlertDialog(
        content: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sorry mate try again",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: GradientButton(
                  text: "Confirm",
                  onPress: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  isItCorrect(answer, id, answerText, typeOf) {
    print(isSelected);
    print(answer);
    print(typeOf);
    print("Is it correct");
    if (typeOf == "Option") {
      if (isSelected[answer] == true) {
        return isCorrectPopUp(id);
      } else {
        return notCorrectPopup();
      }
    } else if (typeOf == "Sound") {
      print(lastWords);
      print(answerText);
      if (lastWords == answerText) {
        return isCorrectPopUp(id);
      } else {
        return notCorrectPopup();
      }
    }
  }

  bool _hasSpeech = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = '';
  String lastError = '';
  String lastStatus = '';
  String _currentLocaleId = '';
  int resultListened = 0;
  List<LocaleName> _localeNames = [];

  final SpeechToText speech = SpeechToText();
  Future<void> initSpeechState() async {
    var hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener, debugLogging: true);
    if (hasSpeech) {
      _localeNames = await speech.locales();

      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale.localeId;
    }

    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  void startListening() {
    lastWords = '';
    lastError = '';
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 5),
        pauseFor: Duration(seconds: 5),
        partialResults: false,
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    ++resultListened;
    print('Result listener $resultListened');
    setState(() {
      lastWords = '${result.recognizedWords}';
    });
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    // print("Received error status: $error, listening: ${speech.isListening}");
    setState(() {
      lastError = '${error.errorMsg} - ${error.permanent}';
    });
  }

  void statusListener(String status) {
    // print(
    // 'Received listener status: $status, listening: ${speech.isListening}');
    setState(() {
      lastStatus = '$status';
    });
  }

  void _switchLang(selectedVal) {
    setState(() {
      _currentLocaleId = selectedVal;
    });
    print(selectedVal);
  }
}

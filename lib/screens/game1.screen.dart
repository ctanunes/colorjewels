import 'package:color_jewels_app/models/language.model.dart';
import 'package:color_jewels_app/screens/welcome.screen.dart';
import 'package:flutter/material.dart';
import 'package:color_jewels_app/widgets/buttons/gradient.button.dart';
import 'package:color_jewels_app/widgets/detail/header.widget.dart';
import 'package:get/route_manager.dart';

import '../models/language.model.dart';
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
                answer: widget.question.answer ?? "Answer",
                typeOf: widget.question.typeOf ?? "typeOf",
                onPress: () {
                  showDialog(
                    context: context,
                    child: AlertDialog(
                      content: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "This is the language ${widget.question.question}",
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: GradientButton(
                                text: "Confirm",
                                onPress: () {
                                  if (widget.question.id == 4) {
                                    Get.to(WelcomeScreen());
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return GameScreen(
                                            question: eng[widget.question.id],
                                          );
                                        },
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContentDetail extends StatefulWidget {
  final String question;
  final Function onPress;
  final String answer;
  final String typeOf;
  const ContentDetail({
    Key key,
    @required this.question,
    this.onPress,
    this.answer,
    this.typeOf,
  }) : super(key: key);

  @override
  _ContentDetailState createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          option(this.widget.typeOf, size),
          SizedBox(height: 25),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: GradientButton(
              text: "Time to go!",
              onPress: this.widget.onPress,
            ),
          ),
        ],
      ),
    );
  }

  List<bool> isSelected = [false, false, false];

  Widget option(String option, Size size) {
    if (option == "Option") {
      return StatefulBuilder(builder: (context, setState) {
        return ToggleButtons(
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.call),
            Icon(Icons.cake),
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
}

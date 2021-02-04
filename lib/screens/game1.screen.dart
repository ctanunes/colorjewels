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
                question: widget.question.question ?? "Title",
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
                                  if (widget.question.id==4){
                                    Get.to(WelcomeScreen());
                                  }else{
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

class ContentDetail extends StatelessWidget {
  final String question;
  final Function onPress;

  const ContentDetail({
    Key key,
    @required this.question, this.onPress,
  }) : super(key: key);

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
            this.question,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.06,
            ),
          ),
          SizedBox(height: 25),
          Row(
            children: <Widget>[
              Text(
                "Something",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.05,
                  color: Colors.green[700].withOpacity(0.8),
                ),
              ),
              SizedBox(width: 5),
              Text(
                "Something",
                style: TextStyle(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: GradientButton(
              text: "Time to go!",
              onPress: this.onPress,
            ),
          ),
        ],
      ),
    );
  }
}

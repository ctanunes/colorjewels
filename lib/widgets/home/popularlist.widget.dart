import 'package:color_jewels_app/screens/game1.screen.dart';
import 'package:color_jewels_app/screens/game2.screen.dart';
import 'package:color_jewels_app/screens/game3.screen.dart';
import 'package:color_jewels_app/screens/home.screen.dart';
import 'package:color_jewels_app/screens/welcome.screen.dart';
import 'package:flutter/material.dart';
import 'package:color_jewels_app/models/language.model.dart';
import 'package:color_jewels_app/models/question.model.dart';
import 'package:color_jewels_app/widgets/home/popularcard.widget.dart';

import 'package:flutter_tts/flutter_tts.dart';

class PopularList extends StatefulWidget {
  final List<Language> listPopular;

  const PopularList({
    Key key,
    @required this.listPopular,
  }) : super(key: key);
  @override
  _PopularListState createState() => _PopularListState();
}

class _PopularListState extends State<PopularList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: Text(
              "All Jewels",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: size.width * 0.045,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.listPopular.length,
              itemBuilder: (context, index) => buildPopularCard(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPopularCard(int index) {
    return PopularCard(
      recent: widget.listPopular[index],
      isSaved: widget.listPopular[index].isPlayed,
      onSaved: () {
        widget.listPopular[index].isPlayed =
            !widget.listPopular[index].isPlayed;
        setState(() {});
      },
      onPress: () {
        jewels.add(widget.listPopular[index]);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              if (index == 1) {
                return GameScreen(
                  question: eng[0],
                );
              } else if (index == 0) {
                return GameScreenPT(question: pt[0]);
              } else if (index == 2) {
                return GameScreenFR(question: fr[0]);
              }
              return GameScreen(
                question: eng[0],
              );
            },
          ),
        );
      },
    );
  }
}

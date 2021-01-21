import 'package:color_jewels_app/models/language.model.dart';
import 'package:flutter/material.dart';
import 'package:color_jewels_app/widgets/buttons/gradient.button.dart';
import 'package:color_jewels_app/widgets/detail/header.widget.dart';

import '../models/language.model.dart';

class DetailScreen extends StatefulWidget {
  final Language language;

  const DetailScreen({
    Key key,
    @required this.language,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
                image: widget.language.image ?? "assets/images/detail.png",
                onBackPress: () {
                  Navigator.pop(context);
                },
                onLikePress: () {
                  widget.language.isPlayed = !widget.language.isPlayed;
                  setState(() {});
                },
                isLike: widget.language.isPlayed,
              ),
              ContentDetail(
                title: widget.language.title ?? "Title",
                location: widget.language.location ?? "Location",
                description: widget.language.description ?? "",
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
                              "This is the language ${widget.language.title}",
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
  final String title, location, description;
  final Function onPress;

  const ContentDetail({
    Key key,
    @required this.title,
    @required this.location,
    @required this.description,
    @required this.onPress,
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
            this.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.06,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 13,
                  color: Colors.green,
                ),
                SizedBox(width: 5),
                Text(
                  this.location,
                  style: TextStyle(
                    fontSize: size.width * 0.035,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Text(
            "Something",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.05,
            ),
          ),
          SizedBox(height: 5),
          Text(
            this.description,
            style: TextStyle(
              fontSize: size.width * 0.04,
              color: Colors.black.withOpacity(0.6),
              height: 1.3,
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

import 'package:flutter/material.dart';

class ContentWelcome extends StatelessWidget {
  const ContentWelcome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Tips",
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.w400,
              fontSize: size.width * 0.07,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Color Jewels",
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.07,
            ),
          ),
          SizedBox(height: 25),
          Text(
            "Are you ready to start coloring your life?\nWith this app you will be able to learn all colors of the rainbow in different languages.",
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.w300,
              fontSize: size.width * 0.04,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Good luck!",
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.w600,
              fontSize: size.width * 0.04,
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:color_jewels_app/models/language.model.dart';
import 'package:color_jewels_app/widgets/home/recentcard.widget.dart';

import '../../models/language.model.dart';

class RecentList extends StatefulWidget {
  final List<Language> listRecent;

  const RecentList({
    Key key,
    @required this.listRecent,
  }) : super(key: key);

  @override
  _RecentListState createState() => _RecentListState();
}

class _RecentListState extends State<RecentList> {
  PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.9,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AspectRatio(
        aspectRatio: 2,
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.listRecent.length,
          itemBuilder: (context, index) => buildRecentSlider(index),
        ),
      ),
    );
  }

  Widget buildRecentSlider(int index) {
    return RecentCard(
      recent: widget.listRecent[index],
      isSaved: widget.listRecent[index].isPlayed,
      onSaved: () {
        widget.listRecent[index].isPlayed = !widget.listRecent[index].isPlayed;
        setState(() {});
      },
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              /*return DetailScreen(
                mountain: widget.listRecent[index],
              );*/
            },
          ),
        );
      },
    );
  }
}

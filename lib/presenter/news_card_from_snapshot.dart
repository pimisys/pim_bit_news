import 'package:app1/models/news.dart';
import 'package:app1/view/widgets/news_card.dart';
import 'package:flutter/material.dart';

class NewsCardFromSnapshot extends StatelessWidget {
  final News snapshotData;
  final Function(News) onTapFav;

  NewsCardFromSnapshot(
      {Key key, @required this.snapshotData, @required this.onTapFav});

  @override
  Widget build(BuildContext context) {
    return NewsCard(
      news: snapshotData,
      onTapFav: onTapFav,
    );
  }
}

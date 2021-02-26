import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pim_bit_news/models/news.dart';

class NewsCardOpen extends StatelessWidget {
  final News news;

  const NewsCardOpen({Key key, @required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'BIT News',
          style: TextStyle(color: Colors.black26),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.favorite),
          )
        ],
      ),
      body: Container(
        //width: 344,
        //height: MediaQuery.of(context).size.height / 1.72,
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.black12)
            ]),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: news.urlToImage != null
                          ? NetworkImage(news.urlToImage)
                          : AssetImage('assets/img/backbit.png'))),
            ),
            Container(
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title ?? 'Title not found',
//                  maxLines: 3,
                    style: GoogleFonts.signika(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    news.content ?? 'Content not found',
                    //textHeightBehavior: TextHeightBehavior() ,
                    //maxLines: 100,
                    overflow: TextOverflow.visible,
                    style: GoogleFonts.signika(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Author: ${news.author}',
                    style: GoogleFonts.signika(
                      fontSize: 14,
                      color: Colors.black45,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'Publishet at: ${news.publishedAt}',
                    style: GoogleFonts.signika(
                      fontSize: 14,
                      color: Colors.black45,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

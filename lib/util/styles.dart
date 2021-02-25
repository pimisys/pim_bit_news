import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants_bit_news.dart';

class PimStyles {
  // static const primaryTextStyle = TextStyle(
  //   fontSize: 20,
  //   fontWeight: FontWeight.bold,
  //   color: Colors.yellow,
  // );

  static const drawerOptionStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  // static const secondaryTextStyle = TextStyle(
  //   fontSize: 28,
  //   fontWeight: FontWeight.bold,
  //   color: Colors.black87,
  // );

  static const buttonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}

class PimLabel extends StatelessWidget {
  final String caption;
  final double fontSize;

  const PimLabel(
      {Key key, @required this.caption, this.fontSize = fontSizeLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$caption",
      style: GoogleFonts.signika(
        color: Colors.black54,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }
}

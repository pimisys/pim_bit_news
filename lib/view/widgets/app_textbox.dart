import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pim_bit_news/util/colors.dart';
import 'package:pim_bit_news/util/constants_bit_news.dart';

class PimTextBox extends StatefulWidget {
  final String hintText;
  final Widget icon;
  final bool obscureText;
  final TextEditingController controller;

  const PimTextBox({
    Key key,
    this.hintText,
    this.icon,
    this.obscureText = false,
    @required this.controller,
  }) : super(key: key);

  @override
  _PimTextBoxState createState() => _PimTextBoxState();
}

class _PimTextBoxState extends State<PimTextBox> {
  @override
  Widget build(BuildContext context) {
//    bool _showPassword = !widget.obscureText;

    return Container(
      //padding: EdgeInsets.only(left: 15, right: 15),
      //margin: EdgeInsets.all(10),
      //width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 8,
            //offset: Offset(15, 5),
          ),
        ],
        color: colorBlanco,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: TextField(
        obscureText: widget.obscureText, //!_showPassword,
        controller: widget.controller,
        //style: TextStyle(color: Colors.blue),
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          // suffixIcon: widget.obscureText
          //     ? IconButton(
          //         icon: Icon(
          //           _showPassword
          //               ? Icons.remove_red_eye_outlined
          //               : Icons.remove_red_eye,
          //         ),
          //         onPressed: () {
          //           setState(() {
          //             _showPassword = !_showPassword;
          //           });
          //         },
          //       )
          //     : null,

          hintText: widget.hintText,
          //border: InputBorder.none,
          //hintStyle: GoogleFonts.signika(
          //    fontSize: 18,
          //    color: Colors.black45,
          //    fontWeight: FontWeight.normal),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
//          focusColor: Colors.grey,
//          fillColor: Colors.grey,
//          hoverColor: Colors.grey,
          //suffixIcon: Icon(Icons.person),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), //sobraria?
          ),
        ),
      ),
    );
  }
}

class PimLabel extends StatelessWidget {
  final String caption;
  final double fontSize;
  final Color color;

  const PimLabel(
      {Key key,
      @required this.caption,
      this.fontSize = fontSizeLabel,
      this.color = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$caption",
      style: GoogleFonts.signika(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }
}

import 'package:app1/util/colors.dart';
import 'package:flutter/material.dart';

class PimTextBox extends StatelessWidget {
  final String hintText;
  final Widget icon;
  final bool obscureText;

  const PimTextBox({
    Key key,
    this.hintText,
    this.icon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            //offset: Offset(15, 5),
          ),
        ],
        color: colorBlanco,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: TextField(
        obscureText: obscureText,
        //style: TextStyle(color: Colors.blue),
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hintText,
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pim_bit_news/util/colors.dart';
import 'package:pim_bit_news/util/styles.dart';

class PimButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final GestureTapCallback onTap; //se agrega porque cesar lo recomendo!!!
  final double height;
  final double width;

  //bool _status;

  const PimButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.onTap,
    this.height = 55,
    this.width = 340,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            //offset: Offset(15, 5),
          ),
        ],
        color: colorBlanco,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: RaisedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: PimStyles.buttonTextStyle,
            textAlign: TextAlign.center,
          ),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

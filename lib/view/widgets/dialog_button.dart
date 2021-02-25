import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const DialogButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: FlatButton(
          minWidth: 95,
          //color: Colors.yellow,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.red),
          )),
    );
  }
}

class PimAlertDialogBoxYN extends StatelessWidget {
  final String title;
  final String question;
  final Function onPressedY;
  final Function onPressedN;

  const PimAlertDialogBoxYN(
      {Key key,
      this.title,
      @required this.question,
      @required this.onPressedY,
      this.onPressedN})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //title: Text(title),
      content: Text(question),
      actions: [
        DialogButton(
            text: 'NO',
            onPressed: () {
              //onPressedN
              //if (onPressedN == null) {
              //  onPressedN();
              //} else {
              Navigator.pop(context);
              //}
            }),
        DialogButton(
            text: 'YES',
            onPressed: () {
              onPressedY();
            })
      ],
    );
    ;
  }
}

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
      this.onPressedY,
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
          onPressed: onPressedN == null
              ? () {
                  Navigator.pop(context);
                }
              : () {
                  Navigator.pop(context);
                  onPressedN();
                },
        ),
        DialogButton(
          text: 'YES',
          onPressed: onPressedY == null
              ? () {
                  Navigator.pop(context);
                }
              : () {
                  Navigator.pop(context);
                  onPressedY();
                },
        ),
      ],
    );
    ;
  }
}

class PimAlertDialogMsgBox extends StatelessWidget {
  final String title;
  final String message;
  final Function onPressed;

  const PimAlertDialogMsgBox(
      {Key key, this.title, @required this.message, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        //FlatButton(),
        DialogButton(
          text: 'OK',
          onPressed: onPressed == null
              ? () {
                  Navigator.of(context).pop();
                  ;
                }
              : () {
                  Navigator.of(context).pop();
                  ;
                  onPressed();
                },
        )
      ],
    );
    ;
  }
}

showMaterialDialog({@required context, @required String message}) {
  showDialog(
    context: context,
    builder: (_) => new PimAlertDialogMsgBox(
      title: 'Warning!',
      message: message,
    ),
  );
}

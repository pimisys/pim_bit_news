import 'package:app1/util/styles.dart';
import 'package:flutter/material.dart';

//Define una opcion del Drawer
//NOTA: todos los stalesswidgets deben tener sus variables globales "final"

class DrawerOption extends StatelessWidget {
  final String text;
  final Function onTap;

  const DrawerOption({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // cambiar x ListTile o InkWell

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Text(
          '> $text',
          style: PimStyles.drawerOptionStyle,
        ),
      ),
    );
  }
}

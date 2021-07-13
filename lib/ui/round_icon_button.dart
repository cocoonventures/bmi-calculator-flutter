import 'package:flutter/material.dart';
import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {required this.funktion, required this.icon, this.callback});

  final IconData icon;
  final Function funktion;
  final Function? callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: funktion as void Function()?,
      onLongPress: () {
        funktion(ButtonPressMode.longPress);
      },
      onLongPressEnd: callback as void Function(LongPressEndDetails)?,
      child: RawMaterialButton(
        onPressed: () {
          funktion(ButtonPressMode.shortPress);
        },
        child: Icon(icon),
        elevation: 6,
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
      ),
    );
  }
}

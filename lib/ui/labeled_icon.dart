import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'constants.dart';

class LabeledIcon extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String text;
  final double textSize;
  final Color textColor;

  const LabeledIcon(
      {Key? key,
      required this.icon,
      this.iconSize = 100.0,
      this.text = "",
      this.textSize = 18.0,
      this.textColor = const Color(0xFF8D8E98)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: 12.0,
        ),
        Text(text,
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
            ))
      ],
    );
  }
}

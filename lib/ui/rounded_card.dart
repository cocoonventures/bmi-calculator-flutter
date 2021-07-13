import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class RoundedCard extends StatelessWidget {
  final double margin, radius;
  final Color color;
  final Widget? child;
  final onPress;

  const RoundedCard(
      {Key? key,
      this.margin = 15.0,
      this.color = kActiveCardColor,
      this.radius = 15.0,
      this.child,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

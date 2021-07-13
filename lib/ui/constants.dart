import 'dart:ui';

import 'package:flutter/material.dart';

const Color kActiveCardColor = Color(0xFF1D1E33);
const Color kInactiveCardColor = Color(0xFF111328);
const double kBottomContainerHeight = 85.0;
const Color kBottomContainerColor = Color(0xFFEB1555);
const TextStyle kButtonTextStyle =
    TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold);
const TextStyle kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);
const TextStyle kInputTextStyle = TextStyle(
  fontSize: 65.0,
  fontWeight: FontWeight.w900,
);
const TextStyle kTitleTextStyle = TextStyle(
  fontSize: 65.0,
  fontWeight: FontWeight.w900,
);

const TextStyle kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const TextStyle kBMIStyle = TextStyle(
  fontSize: 128.0,
  fontWeight: FontWeight.bold,
);

const TextStyle kBodyTextStyle = TextStyle(
  // color: Color(0xFF24D876),
  fontSize: 22.0,
  // fontWeight: FontWeight.bold,
);
//const SliderTheme SliderTheme = SliderTheme(
//);
const SliderThemeData kSliderThemeData = SliderThemeData();

enum Gender {
  male,
  female,
}

enum ButtonPressMode {
  shortPress,
  longPress,
}

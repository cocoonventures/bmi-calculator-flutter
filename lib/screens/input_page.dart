import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../ui/rounded_card.dart';
import '../ui/labeled_icon.dart';
import '../ui/constants.dart';
import '../ui/round_icon_button.dart';
// import '../ui/bottom_button.dart';
import '../calculator_brain.dart';
import 'results_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  int _height = 72; // default height in inches
  int _weight = 150; // default weight in lbs
  int _age = 25; // default age
  late Timer _timer;

  Gender? gender;

  // gender
  void updateGender(Gender newGender) {
    print("changing to $newGender");
    gender = newGender;
    maleCardColor =
        (gender == Gender.male) ? kActiveCardColor : kInactiveCardColor;
    femaleCardColor =
        (gender == Gender.female) ? kActiveCardColor : kInactiveCardColor;
  }

  String heightToString(int h) {
    int feet = h ~/ 12;
    int inches = h % 12;
    return "$feet\' $inches\"";
  }

  void heightChange(double height) {
    setState(() {
      this._height = height.toInt();
    });
  }

  void loseWeight([ButtonPressMode mode = ButtonPressMode.shortPress]) {
//    Timer timer;
    if (mode == ButtonPressMode.longPress) {
      _timer = Timer.periodic(Duration(milliseconds: 500), (t) {
        setState(() {
          _weight -= 10;
        });
      });
    } else {
      setState(() {
        _weight--;
      });
    }
  }

  void killGesture(LongPressEndDetails details) {
    _timer.cancel();
  }

  void gainWeight([ButtonPressMode mode = ButtonPressMode.shortPress]) {
    if (mode == ButtonPressMode.longPress) {
      _timer = Timer.periodic(Duration(milliseconds: 500), (t) {
        setState(() {
          _weight += 10;
        });
      });
    } else {
      setState(() {
        _weight++;
      });
    }
  }

  void growOld([ButtonPressMode mode = ButtonPressMode.shortPress]) {
    if (mode == ButtonPressMode.longPress) {
      _timer = Timer.periodic(Duration(milliseconds: 500), (t) {
        setState(() {
          _age += 5;
        });
      });
    } else {
      setState(() {
        _age++;
      });
    }
  }

  void growYoung([ButtonPressMode mode = ButtonPressMode.shortPress]) {
//    Timer timer;
    if (mode == ButtonPressMode.longPress) {
      _timer = Timer.periodic(Duration(milliseconds: 500), (t) {
        setState(() {
          _age -= 5;
        });
      });
    } else {
      setState(() {
        _age--;
      });
    }
  }

  double calculateBMI() {
    return _weight / (_height ^ 2) * 703;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RoundedCard(
                      onPress: () {
                        setState(() {
                          updateGender(Gender.male);
                        });
                      },
                      color: maleCardColor,
                      child: LabeledIcon(
                          text: "MALE", icon: FontAwesomeIcons.mars),
                    ),
                  ),
                  Expanded(
                    child: RoundedCard(
                      onPress: () {
                        setState(() {
                          updateGender(Gender.female);
                        });
                      },
                      color: femaleCardColor,
                      child: LabeledIcon(
                          text: "FEMALE", icon: FontAwesomeIcons.venus),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RoundedCard(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('HEIGHT', style: kLabelTextStyle),
                            Row(
                              textBaseline: TextBaseline.alphabetic,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: <Widget>[
                                Text(
                                  heightToString(_height),
                                  style: kInputTextStyle,
                                ),
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        activeTrackColor: Colors.pinkAccent,
                                        thumbColor: Colors.pinkAccent,
                                        thumbShape: RoundSliderThumbShape(
                                          enabledThumbRadius: 15.0,
                                        ),
                                        inactiveTrackColor: Colors.grey,
                                        overlayColor: Colors
                                            .white12, // Color(0x29FFFFFF),
                                        overlayShape: RoundSliderOverlayShape(
                                            overlayRadius: 24.0),
                                      ),
                                      child: Slider(
                                        value: _height.toDouble(),
                                        min: 48,
                                        max: 96,
                                        onChanged: heightChange,
                                      ),
                                    ),
                                  ),
                                ]),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RoundedCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT (LBS)',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            _weight.toString(),
                            style: kInputTextStyle,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  funktion: loseWeight,
                                  icon: FontAwesomeIcons.minus,
                                  callback: killGesture,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  funktion: gainWeight,
                                  icon: FontAwesomeIcons.plus,
                                  callback: killGesture,
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: RoundedCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            _age.toString(),
                            style: kInputTextStyle,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  funktion: growYoung,
                                  icon: FontAwesomeIcons.minus,
                                  callback: killGesture,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  funktion: growOld,
                                  icon: FontAwesomeIcons.plus,
                                  callback: killGesture,
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // -----------------------------------------------------------------
            // original item not working
            // -----------------------------------------------------------------
            // BottomButton(
            //   buttonTitle: "CALCULATE BMI",
            //   onTap: () {
            //     CalculatorBrain calc =
            //         CalculatorBrain(height: _height, weight: _weight);
            //     Navigator.pushNamed(
            //       context,
            //       ResultsPage.routeName,
            //       arguments: {
            //         'bmiResult': "NOT null!", //calc.calculateBMI(),
            //         'resultText': calc.getResult(),
            //         'interpretation': calc.getInterpretation(),
            //       },
            //     );
            //   },
            // ),
            // -----------------------------------------------------------------

            GestureDetector(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: _height, weight: _weight);
                Navigator.pushNamed(
                  context,
                  ResultsPage.routeName,
                  arguments: {
                    'bmiResult': calc.calculateBMI(),
                    'resultText': calc.getResult(),
                    'interpretation': calc.getInterpretation(),
                  },
                );
              },
              child: Container(
                  color: kBottomContainerColor,
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: kBottomContainerHeight,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "CALCULATE BMI",
                      style: kButtonTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ]),
    );
  }
}

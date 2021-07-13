// import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/ui/rounded_card.dart';
import 'package:flutter/material.dart';
import '../ui/constants.dart';
import '../ui/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  // ResultsPage({
  //   required this.bmiResult,
  //   required this.resultText,
  //   required this.interpretation,
  // });

  static const routeName = '/results';

  late String bmiResult;
  late String resultText;
  late String interpretation;

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    bmiResult = arg['bmiResult'];
    resultText = arg['resultText'];
    interpretation = arg['interpretation'];

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Your Result",
              textAlign: TextAlign.center,
              style: kTitleTextStyle,
            ),
          )),
          Expanded(
            flex: 5,
            child: RoundedCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMIStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}

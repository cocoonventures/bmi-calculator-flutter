import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  final Color primaryColor = Color.fromRGBO(9, 11, 34, 1.0);

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as Map;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: primaryColor,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => InputPage(),
          '/results': (context) => ResultsPage(
                bmiResult: arg?['bmiResult'] ?? "Poop1",
                resultText: arg?['resultText'] ?? "Poop2",
                interpretation: arg?['interpretation'] ?? "Poop3",
              ),
        });
  }
}

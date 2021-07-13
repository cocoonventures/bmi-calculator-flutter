import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int? height;
  final int? weight;
  late double _bmi;

  String calculateBMI() {
    _bmi = (weight! / pow(height!, 2)) * 703;
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    calculateBMI();
    if (_bmi > 25) {
      return "Overweight";
    } else if (_bmi > 18) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi > 25) {
      return "It's time to hit the gym!";
    } else if (_bmi > 18) {
      return "Keep it up";
    } else {
      return "Eat a sandwich or something!";
    }
  }
}

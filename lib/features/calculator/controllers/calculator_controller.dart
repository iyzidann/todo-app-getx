import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  var input = ''.obs;
  var result = ''.obs;

  void append(String value) {
    if (value == 'C') {
      input.value = '';
      result.value = '';
    } else if (value == '=') {
      _calculate();
    } else if (value == '⌫') {
      if (input.isNotEmpty) {
        input.value = input.value.substring(0, input.value.length - 1);
      }
    } else {
      input.value += value;
    }
  }

  void _calculate() {
    try {
      final exp = input.value.replaceAll('×', '*').replaceAll('÷', '/');
      Parser p = Parser();
      Expression expression = p.parse(exp);
      ContextModel cm = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, cm);

      result.value = eval.toStringAsFixed(eval.truncateToDouble() == eval ? 0 : 2);
    } catch (e) {
      result.value = 'Error';
    }
  }
}

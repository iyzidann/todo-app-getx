import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  var input = ''.obs;
  var result = ''.obs;
  var lastWasEqual = false; 

  void append(String value) {
    if (value == 'C') {
      input.value = '';
      result.value = '';
      lastWasEqual = false;
    } 
    else if (value == '=') {
      _calculate();
      lastWasEqual = true;
    } 
    else if (value == '⌫') {
      if (input.isNotEmpty) {
        input.value = input.value.substring(0, input.value.length - 1);
      }
    } 
    else {
      if (lastWasEqual && _isOperator(value)) {
        // kalau baru selesai operasi dan user tekan operator
        input.value = result.value + value;
        lastWasEqual = false;
      } else if (lastWasEqual && !_isOperator(value)) {
        // kalau baru selesai operasi dan user tekan angka
        input.value = value;
        lastWasEqual = false;
      } else {
        input.value += value;
      }
    }
  }

  bool _isOperator(String value) {
    return ['+', '-', '×', '÷'].contains(value);
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

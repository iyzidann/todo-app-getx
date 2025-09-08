import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  var input = ''.obs;
  var result = ''.obs;
  var displayInput = ''.obs;
  var lastWasEqual = false;

  void append(String value) {
    if (value == 'C') {
      input.value = '';
      result.value = '';
      displayInput.value = '';
      lastWasEqual = false;
    } 
    else if (value == '=') {
      _calculate();
      lastWasEqual = true;
      displayInput.value = _formatExpression(input.value);
    } 
    else if (value == '⌫') {
      if (input.isNotEmpty) {
        input.value = input.value.substring(0, input.value.length - 1);
        displayInput.value = _formatExpression(input.value);
      }
    } 
    else {
      if (lastWasEqual && _isOperator(value)) {
        // kalau baru selesai operasi dan user tekan operator
        input.value = _unformatNumber(result.value) + value;
        lastWasEqual = false;
        displayInput.value = _formatExpression(input.value);
      } else if (lastWasEqual && !_isOperator(value)) {
        // kalau baru selesai operasi dan user tekan angka
        input.value = value;
        lastWasEqual = false;
        displayInput.value = _formatExpression(input.value);
      } else {
        input.value += value;
        displayInput.value = _formatExpression(input.value);
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
    result.value = _formatNumber(result.value);
  }

  String _formatNumber(String numStr) {
    if (numStr == 'Error') return numStr;
    if (numStr.startsWith('-')) {
      return '-' + _formatNumber(numStr.substring(1));
    }
    if (!numStr.contains('.')) {
      return _formatInteger(numStr);
    }
    List<String> parts = numStr.split('.');
    String integerPart = _formatInteger(parts[0]);
    String decimalPart = parts.length > 1 ? '.' + parts[1] : '';
    return integerPart + decimalPart;
  }

  String _unformatNumber(String formatted) {
    if (formatted == 'Error') return formatted;
    return formatted.replaceAll(',', '');
  }

  String _formatInteger(String s) {
    if (s.length < 4) return s;
    StringBuffer sb = StringBuffer();
    int count = 0;
    for (int i = s.length - 1; i >= 0; i--) {
      sb.write(s[i]);
      count++;
      if (count % 3 == 0 && i > 0) {
        sb.write(',');
      }
    }
    return sb.toString().split('').reversed.join('');
  }

  String _formatExpression(String expr) {
    StringBuffer sb = StringBuffer();
    bool inNumber = false;
    StringBuffer currentNum = StringBuffer();
    for (int i = 0; i < expr.length; i++) {
      String char = expr[i];
      if (RegExp(r'[\d.]').hasMatch(char)) {
        currentNum.write(char);
        inNumber = true;
      } else {
        if (inNumber) {
          sb.write(_formatNumber(currentNum.toString()));
          currentNum.clear();
          inNumber = false;
        }
        sb.write(char);
      }
    }
    if (inNumber) {
      sb.write(_formatNumber(currentNum.toString()));
    }
    return sb.toString();
  }
}

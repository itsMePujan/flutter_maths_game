// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier {
  var temp = '';
  var randomA = Random().nextInt(100);
  var randomB = Random().nextInt(100);
  var operator = ' + ';

  var result;
  List<String> numberPad = [
    '7',
    '8',
    '9',
    '',
    '4',
    '5',
    '6',
    'C',
    '1',
    '2',
    '3',
    'DEL',
    '.',
    '0',
    'Reload',
    '=',
  ];

  void onClicked(pKey) {
    if (pKey == 'C') {
      temp = '';
    } else if (pKey == 'DEL') {
      if (temp.isNotEmpty) {
        temp = temp.substring(0, temp.length - 1);
      }
    } else if (pKey == '=') {
      checkResult();
      if (temp == result) {
        print('Correct');
      } else {
        print('Incorrect');
      }
    } else if (pKey == 'Reload') {
      randomA = Random().nextInt(100);
      randomB = Random().nextInt(100);
      operator = randomListItem(randomOperator);
      temp = '';
    } else {
      temp += pKey;
    }
    notifyListeners();
  }

  var randomOperator = [
    ' * ',
    ' + ',
    ' - ',
  ];
  randomListItem(List randomOperator) =>
      randomOperator[Random().nextInt(randomOperator.length)];

  checkResult() {
    switch (operator) {
      case ' * ':
        {
          result = (randomA * randomB).toString();
        }
        break;
      case ' + ':
        {
          result = (randomA + randomB).toString();
        }
        break;
      case ' - ':
        {
          result = (randomA - randomB).toString();
        }
        break;
    }
  }
}

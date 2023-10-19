import 'dart:async';
import 'dart:math' show Random;
import 'package:flutter/foundation.dart';

const _kRepeat = 6;
const _kMax = 99;

class CalcModel {
  List<int> generateNumbers() {
    final numbers = <int>[];

    for (var i = 0; i < _kRepeat; i++) {
      final number = Random().nextInt(_kMax) + 1;
      numbers.add(number);
    }

    return numbers;
  }

  void challenge({
    required List<int> numbers,
    required void Function(int) onNext,
    required VoidCallback onEnd,
  }) {
    Timer.periodic(const Duration(seconds: 1), (t) {
      final index = t.tick - 1;

      if (index < numbers.length) {
        onNext(numbers[index]);
      } else {
        t.cancel();
        onEnd();
      }
    });
  }
}

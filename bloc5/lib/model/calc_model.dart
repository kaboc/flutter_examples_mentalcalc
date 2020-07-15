import 'dart:async';
import 'dart:math' show Random;
import 'package:flutter/foundation.dart';

const _kRepeat = 6;
const _kMaxValue = 99;

class CalcModel {
  List<int> generateNumbers() {
    final numbers = <int>[];

    for (int i = 0; i < _kRepeat; i++) {
      final value = Random().nextInt(_kMaxValue) + 1;
      numbers.add(value);
    }

    return numbers;
  }

  void challenge({
    @required List<int> numbers,
    @required void Function(int) onNext,
    @required VoidCallback onEnd,
  }) {
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
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

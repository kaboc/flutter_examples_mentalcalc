import 'dart:async';
import 'dart:math' show Random;
import 'package:scoped_model/scoped_model.dart';

export 'package:scoped_model/scoped_model.dart';

class CalcModel extends Model {
  static const _repeat = 6;
  String _lastOutput = '';
  int _sum;
  bool _isBtnVisible = true;

  String get output => _lastOutput;
  bool get isBtnVisible => _isBtnVisible;

  void _reset() {
    _lastOutput = '';
    _sum = 0;
    _isBtnVisible = false;
    notifyListeners();
  }

  void start() {
    _reset();

    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (t.tick < _repeat + 1) {
        final num = Random().nextInt(99) + 1;
        _lastOutput = '$num';
        _sum += num;
      } else {
        t.cancel();
        _lastOutput = 'Answer: $_sum';
        _isBtnVisible = true;
      }

      notifyListeners();
    });
  }
}

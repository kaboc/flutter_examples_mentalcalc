import 'dart:math' show Random;

class CalcModel {
  static const _kRepeat = 6;
  static const _kMaxValue = 99;

  final _list = <int>[];

  List<int> get list => _list;
  int get sum => _list.fold<int>(0, (a, b) => a + b);

  void reset() {
    _list.clear();
  }

  bool isEnd(int count) {
    return count == _kRepeat + 1;
  }

  int nextValue() {
    final value = Random().nextInt(_kMaxValue) + 1;
    _list.add(value);
    return value;
  }
}

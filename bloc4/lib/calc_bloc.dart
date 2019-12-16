import 'dart:async';
import 'dart:math' show Random;

class CalcBloc {
  final _outputController = StreamController<String>();
  final _btnController = StreamController<bool>();

  Stream<String> get onAdd => _outputController.stream;
  Stream<bool> get onToggle => _btnController.stream;

  static const _repeat = 6;
  int _sum;
  Timer _timer;

  void start() {
    _sum = 0;
    _outputController.sink.add('');
    _btnController.sink.add(false);

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      _calc(t.tick);
    });
  }

  void _calc(int count) {
    if (count < _repeat + 1) {
      final num = Random().nextInt(99) + 1;
      _outputController.sink.add('$num');
      _sum += num;
    } else {
      _timer.cancel();
      _outputController.sink.add('答えは$_sum');
      _btnController.sink.add(true);
    }
  }

  void dispose() {
    _outputController.close();
    _btnController.close();
  }
}

import 'package:bloc_provider/bloc_provider.dart';
import 'dart:async';
import 'dart:math' show Random;

class CalcBloc implements Bloc {
  final _calcController = StreamController<int>();
  final _outputController = StreamController<String>();
  final _btnController = StreamController<bool>();

  Stream<String> get onAdd => _outputController.stream;
  Stream<bool> get onToggle => _btnController.stream;

  final _repeat = 6;
  int _sum;
  Timer _timer;

  CalcBloc() {
    _calcController.stream.listen((count) {
      if (count < _repeat + 1) {
        var num = Random().nextInt(99) + 1;
        _outputController.sink.add('$num');
        _sum += num;
      } else {
        _timer.cancel();
        _outputController.sink.add('答えは$_sum');
        _btnController.sink.add(true);
      }
    });

    _btnController.sink.add(true);
  }

  void start() {
    _sum = 0;
    _outputController.sink.add('');
    _btnController.sink.add(false);

    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      _calcController.sink.add(t.tick);
    });
  }

  @override
  void dispose() async {
    await _calcController.close();
    await _outputController.close();
    await _btnController.close();
  }
}

import 'dart:async';
import 'dart:math' show Random;
import 'package:bloc_provider/bloc_provider.dart';

export 'package:bloc_provider/bloc_provider.dart';

class CalcBloc implements Bloc {
  final _startController = StreamController<void>();
  final _calcController = StreamController<int>();
  final _outputController = StreamController<String>();
  final _btnController = StreamController<bool>();

  StreamSink<void> get start => _startController.sink;
  Stream<String> get onAdd => _outputController.stream;
  Stream<bool> get onToggle => _btnController.stream;

  final _repeat = 6;
  int _sum;
  Timer _timer;

  CalcBloc() {
    _startController.stream.listen((_) => _start());
    _calcController.stream.listen((count) => _calc(count));
    _btnController.sink.add(true);
  }

  void _start() {
    _sum = 0;
    _outputController.sink.add('');
    _btnController.sink.add(false);

    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      _calcController.sink.add(t.tick);
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

  @override
  void dispose() {
    _startController.close();
    _calcController.close();
    _outputController.close();
    _btnController.close();
  }
}

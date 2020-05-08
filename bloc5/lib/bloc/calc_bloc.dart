import 'dart:async';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import 'package:bloc5/bloc/calc_status.dart';
import 'package:bloc5/dto/record_data.dart';
import 'package:bloc5/model/calc_model.dart';
import 'package:bloc5/model/record_model.dart';

export 'package:bloc5/bloc/calc_status.dart';

class CalcBloc {
  CalcBloc({@required Locator locator})
      : _calcModel = locator<CalcModel>(),
        _recordModel = locator<RecordModel>() {
    _startController.stream.listen((_) => _play());
  }

  final CalcModel _calcModel;
  final RecordModel _recordModel;

  final _startController = PublishSubject<void>();
  final _statusController = PublishSubject<CalcStatus>();
  final _valueController = PublishSubject<int>();
  final _recordController = BehaviorSubject<RecordData>.seeded(RecordData.none);

  StreamSink<void> get start => _startController.sink;
  Stream<CalcStatus> get status => _statusController.stream;
  Stream<int> get onNextValue => _valueController.stream;
  Stream<RecordData> get record => _recordController.stream;

  void dispose() {
    _startController.close();
    _statusController.close();
    _valueController.close();
    _recordController.close();
  }

  void _play() {
    _calcModel.reset();

    _valueController.sink.add(0);
    _statusController.sink.add(CalcStatus.play);

    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (_calcModel.isEnd(t.tick)) {
        t.cancel();

        _recordModel.recordLastChallenge(_calcModel.list);
        _recordController.sink.add(RecordData(_recordModel));

        _valueController.sink.add(_calcModel.sum);
        _statusController.sink.add(CalcStatus.stop);
      } else {
        final value = _calcModel.nextValue();
        _valueController.sink.add(value);
      }
    });
  }
}

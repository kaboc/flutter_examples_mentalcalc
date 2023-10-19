import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:bloc5/bloc/record_bloc.dart';
import 'package:bloc5/common/challenge_status.dart';
import 'package:bloc5/model/calc_model.dart';

export 'package:bloc5/common/challenge_status.dart';

class CalcBloc {
  CalcBloc({required this.calcModel, required this.recordBloc}) {
    _startController.stream.listen((_) {
      if (_status != ChallengeStatus.challenge) {
        _challenge();
      }
    });
  }

  final CalcModel calcModel;
  final RecordBloc recordBloc;

  final _startController = PublishSubject<void>();
  final _statusController = PublishSubject<ChallengeStatus>();
  final _numberController = PublishSubject<int>();

  StreamSink<void> get start => _startController.sink;
  Stream<ChallengeStatus> get status => _statusController.stream;
  Stream<int> get number => _numberController.stream;

  ChallengeStatus _status = ChallengeStatus.none;

  void dispose() {
    _startController.close();
    _statusController.close();
    _numberController.close();
  }

  void _challenge() {
    final numbers = calcModel.generateNumbers();

    _init();

    calcModel.challenge(
      numbers: numbers,
      onNext: _onNext,
      onEnd: () => _onEnd(numbers),
    );
  }

  void _init() {
    _numberController.sink.add(0);
    _updateStatus(ChallengeStatus.challenge);
  }

  void _updateStatus(ChallengeStatus status) {
    _status = status;
    _statusController.sink.add(_status);
  }

  void _onNext(int number) {
    _numberController.sink.add(number);
  }

  void _onEnd(List<int> numbers) {
    recordBloc.update.add(numbers);
    _updateStatus(ChallengeStatus.result);
  }
}

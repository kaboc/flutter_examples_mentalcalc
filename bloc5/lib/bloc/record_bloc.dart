import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:bloc5/model/record_state.dart';

export 'package:bloc5/model/record_state.dart';

class RecordBloc {
  RecordBloc() {
    _updateController.stream.listen((numbers) async {
      final newState = _recordController.value.copyWith(numbers: numbers);
      _recordController.sink.add(newState);
    });
  }

  final _updateController = PublishSubject<List<int>>();
  final _recordController =
      BehaviorSubject<RecordState>.seeded(RecordState.none);

  StreamSink<List<int>> get update => _updateController.sink;
  Stream<RecordState> get record => _recordController.stream;

  void dispose() {
    _updateController.close();
    _recordController.close();
  }
}

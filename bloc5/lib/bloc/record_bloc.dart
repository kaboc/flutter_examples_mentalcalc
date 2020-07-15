import 'dart:async';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:bloc5/model/record_model.dart';
import 'package:bloc5/model/record_state.dart';

export 'package:bloc5/model/record_state.dart';

class RecordBloc {
  RecordBloc({@required this.recordModel}) {
    _updateController.stream.listen((numbers) async {
      final newState = recordModel.update(
        lastState: _recordController.value,
        newNumbers: numbers,
      );
      _recordController.sink.add(newState);
    });
  }

  final RecordModel recordModel;

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

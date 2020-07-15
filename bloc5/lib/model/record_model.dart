import 'package:meta/meta.dart';

import 'package:bloc5/model/record_state.dart';

class RecordModel {
  RecordState update({
    @required RecordState lastState,
    @required List<int> newNumbers,
  }) {
    return RecordState(
      times: lastState.times + 1,
      numbers: newNumbers,
      sum: _sum(newNumbers),
    );
  }

  int _sum(List<int> numbers) {
    return numbers.fold<int>(0, (a, b) => a + b);
  }
}

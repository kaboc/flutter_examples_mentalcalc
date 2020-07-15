import 'package:meta/meta.dart';

@immutable
class RecordState {
  const RecordState({
    @required this.times,
    @required this.numbers,
    @required this.sum,
  });

  final int times;
  final List<int> numbers;
  final int sum;

  static const none = RecordState(times: 0, numbers: [], sum: 0);
}

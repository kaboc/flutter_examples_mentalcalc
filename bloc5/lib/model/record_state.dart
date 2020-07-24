import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class RecordState extends Equatable {
  const RecordState({
    @required this.times,
    @required this.numbers,
    @required this.sum,
  });

  final int times;
  final List<int> numbers;
  final int sum;

  static const none = RecordState(times: 0, numbers: [], sum: 0);

  @override
  List<Object> get props => [times, numbers, sum];

  RecordState copyWith({List<int> numbers}) {
    return RecordState(
      times: times + 1,
      numbers: numbers ?? this.numbers,
      sum: _sum(numbers),
    );
  }

  int _sum(List<int> numbers) {
    return numbers.fold<int>(0, (a, b) => a + b);
  }
}

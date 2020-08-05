import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class RecordState extends Equatable {
  const RecordState({@required this.times, @required this.numbers});

  final int times;
  final List<int> numbers;

  int get sum => numbers.fold<int>(0, (a, b) => a + b);

  static const none = RecordState(times: 0, numbers: []);

  @override
  List<Object> get props => [times, numbers];

  RecordState copyWith({List<int> numbers}) {
    return RecordState(
      times: times + 1,
      numbers: numbers ?? this.numbers,
    );
  }
}

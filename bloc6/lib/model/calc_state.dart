import 'package:equatable/equatable.dart';

import 'package:bloc6/common/challenge_status.dart';

class CalcState extends Equatable {
  const CalcState({
    required this.status,
    required this.numbers,
    required this.index,
  });

  final ChallengeStatus status;
  final List<int> numbers;
  final int index;

  static const none = CalcState(
    status: ChallengeStatus.none,
    numbers: [],
    index: 0,
  );

  @override
  List<Object> get props => [status, numbers, index];

  CalcState copyWith({
    ChallengeStatus? status,
    List<int>? numbers,
    int? index,
  }) {
    return CalcState(
      status: status ?? this.status,
      numbers: numbers ?? this.numbers,
      index: index ?? this.index,
    );
  }
}

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc6/common/challenge_status.dart';

@immutable
class CalcState extends Equatable {
  const CalcState({
    @required this.status,
    @required this.number,
  });

  final ChallengeStatus status;
  final int number;

  static const none = CalcState(status: ChallengeStatus.none, number: 0);

  @override
  List<Object> get props => [status, number];

  CalcState copyWith({ChallengeStatus status, int number}) {
    return CalcState(
      status: status ?? this.status,
      number: number ?? this.number,
    );
  }
}

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:bloc6/common/challenge_status.dart';
import 'package:bloc6/model/calc_model.dart';
import 'package:bloc6/model/calc_state.dart';

export 'package:bloc6/common/challenge_status.dart';
export 'package:bloc6/model/calc_state.dart';

class CalcCubit extends Cubit<CalcState> {
  CalcCubit({@required this.calcModel}) : super(CalcState.none);

  final CalcModel calcModel;

  void challenge() {
    final numbers = calcModel.generateNumbers();

    _init(numbers);

    calcModel.challenge(
      numbers: numbers,
      onNext: (number) => _onNext(number),
      onEnd: () => _onEnd(numbers),
    );
  }

  void _init(List<int> numbers) {
    final newState = CalcState(
      status: ChallengeStatus.challenge,
      numbers: numbers,
      index: -1,
    );
    emit(newState);
  }

  void _onNext(int number) {
    final newState = state.copyWith(index: state.index + 1);
    emit(newState);
  }

  void _onEnd(List<int> numbers) {
    final newState = state.copyWith(status: ChallengeStatus.result);
    emit(newState);
  }
}

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:bloc6/common/challenge_status.dart';
import 'package:bloc6/cubit/record_cubit.dart';
import 'package:bloc6/model/calc_model.dart';
import 'package:bloc6/model/calc_state.dart';

export 'package:bloc6/common/challenge_status.dart';
export 'package:bloc6/model/calc_state.dart';

class CalcCubit extends Cubit<CalcState> {
  CalcCubit({@required this.calcModel, @required this.recordCubit})
      : super(CalcState.none);

  final CalcModel calcModel;
  final RecordCubit recordCubit;

  void challenge() {
    final numbers = calcModel.generateNumbers();

    _init();

    calcModel.challenge(
      numbers: numbers,
      onNext: (number) => _onNext(number),
      onEnd: () => _onEnd(numbers),
    );
  }

  void _init() {
    final newState = state.copyWith(
      status: ChallengeStatus.challenge,
      number: 0,
    );
    emit(newState);
  }

  void _onNext(int number) {
    final newState = state.copyWith(number: number);
    emit(newState);
  }

  void _onEnd(List<int> numbers) {
    recordCubit.updateNumbers(numbers);

    final newState = state.copyWith(status: ChallengeStatus.result);
    emit(newState);
  }
}

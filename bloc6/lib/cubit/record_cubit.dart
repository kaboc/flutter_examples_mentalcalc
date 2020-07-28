import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:bloc6/cubit/calc_cubit.dart';
import 'package:bloc6/model/record_state.dart';

export 'package:bloc6/model/record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  RecordCubit({@required CalcCubit calcCubit}) : super(RecordState.none) {
    calcCubit.listen((calcState) {
      if (calcState.status == ChallengeStatus.result) {
        _updateNumbers(calcState.numbers);
      }
    });
  }

  void _updateNumbers(List<int> numbers) {
    final newState = state.copyWith(numbers: numbers);
    emit(newState);
  }
}

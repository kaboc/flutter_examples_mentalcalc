import 'package:bloc/bloc.dart';

import 'package:bloc6/model/record_state.dart';

export 'package:bloc6/model/record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  RecordCubit() : super(RecordState.none);

  void updateNumbers(List<int> numbers) {
    final newState = state.copyWith(numbers: numbers);
    emit(newState);
  }
}

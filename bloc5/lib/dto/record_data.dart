import 'package:bloc5/model/record_model.dart';

class RecordData {
  RecordData(RecordModel model)
      : times = model.times,
        list = model.list;

  const RecordData._()
      : times = 0,
        list = const [];

  final int times;
  final List<int> list;

  static const none = RecordData._();
}

class RecordModel {
  int _totalTimes = 0;
  final List<int> _lastChallenge = [];

  int get times => _totalTimes;
  List<int> get list => _lastChallenge;

  void recordLastChallenge(List<int> list) {
    _totalTimes++;
    _lastChallenge
      ..clear()
      ..addAll(list);
  }
}

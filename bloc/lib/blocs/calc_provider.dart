import 'package:flutter/material.dart';
import 'calc_bloc.dart';

export 'calc_bloc.dart';

class CalcBlocProvider extends InheritedWidget {
  const CalcBlocProvider({super.key, required super.child});

  CalcBloc get bloc => CalcBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static CalcBlocProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CalcBlocProvider>();
  }
}

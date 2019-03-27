import 'package:flutter/material.dart';
import 'calc_bloc.dart';
export 'calc_bloc.dart';

class CalcBlocProvider extends InheritedWidget {
  const CalcBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  CalcBloc get bloc => CalcBloc();

  @override
  bool updateShouldNotify(oldWidget) => oldWidget != this;

  static CalcBlocProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(CalcBlocProvider);
  }
}

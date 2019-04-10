import 'package:flutter/material.dart';
import 'calc_bloc.dart';
import 'screen.dart';

void main() => runApp(
  BlocProvider<CalcBloc>(
    creator: (_context, _bag) => CalcBloc(),
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalcScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'calc_bloc.dart';
import 'screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<CalcBloc>(
        creator: (_context, _bag) => CalcBloc(),
        child: CalcScreen(),
      ),
    );
  }
}

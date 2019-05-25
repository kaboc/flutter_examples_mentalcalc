import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calc_bloc.dart';
import 'screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider<CalcBloc>(
        builder: (_) => CalcBloc(),
        dispose: (_, bloc) => bloc.dispose(),
        child: CalcScreen(),
      ),
    );
  }
}

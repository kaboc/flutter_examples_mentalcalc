import 'package:flutter/material.dart';
import 'blocs/calc_provider.dart';
import 'screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalcBlocProvider(
        child: CalcScreen(),
      ),
    );
  }
}

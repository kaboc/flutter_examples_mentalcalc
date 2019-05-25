import 'package:flutter/material.dart';
import 'calc_model.dart';
import 'screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScopedModel<CalcModel>(
        model: CalcModel(),
        child: CalcScreen(),
      ),
    );
  }
}

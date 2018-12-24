import 'package:flutter/material.dart';
import 'screen.dart';
import 'calc_model.dart';

void main() => runApp(MyApp(
  model: CalcModel(),
));

class MyApp extends StatelessWidget {
  final CalcModel model;

  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScopedModel<CalcModel>(
        model: model,
        child: MaterialApp(
          home: CalcScreen(),
        ),
      ),
    );
  }
}

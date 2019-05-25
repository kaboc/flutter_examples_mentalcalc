import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calc_model.dart';
import 'screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<CalcModel>(
        builder: (_) => CalcModel(),
        child: CalcScreen(),
      ),
    );
  }
}

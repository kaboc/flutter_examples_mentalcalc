import 'package:flutter/material.dart';
import 'calc_model.dart';
import 'screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScopedModel(
        model: CalcModel(),
        child: const CalcScreen(),
      ),
    );
  }
}

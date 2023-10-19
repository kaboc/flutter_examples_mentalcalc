import 'package:flutter/material.dart';
import 'blocs/calc_provider.dart';
import 'screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalcBlocProvider(
        child: CalcScreen(),
      ),
    );
  }
}

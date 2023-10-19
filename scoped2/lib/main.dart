import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calc_model.dart';
import 'screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => CalcModel(),
        child: const CalcScreen(),
      ),
    );
  }
}

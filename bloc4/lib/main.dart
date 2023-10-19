import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calc_bloc.dart';
import 'screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider(
        create: (_) => CalcBloc(),
        dispose: (_, bloc) => bloc.dispose(),
        child: const CalcScreen(),
      ),
    );
  }
}

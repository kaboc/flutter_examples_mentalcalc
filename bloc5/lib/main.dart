import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bloc5/bloc/calc_bloc.dart';
import 'package:bloc5/bloc/record_bloc.dart';
import 'package:bloc5/model/calc_model.dart';
import 'package:bloc5/screen/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MultiProvider(
      providers: [
        Provider(
          create: (context) => RecordBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
        Provider(
          create: (context) => CalcBloc(
            calcModel: CalcModel(),
            recordBloc: context.read<RecordBloc>(),
          ),
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green).copyWith(
          textTheme: textTheme.copyWith(
            bodyMedium: textTheme.bodyMedium?.copyWith(fontSize: 18.0),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

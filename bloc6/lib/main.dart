import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc6/cubit/calc_cubit.dart';
import 'package:bloc6/cubit/record_cubit.dart';
import 'package:bloc6/model/calc_model.dart';
import 'package:bloc6/screen/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CalcCubit(
            calcModel: CalcModel(),
          ),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => RecordCubit(
            calcCubit: context.read<CalcCubit>(),
          ),
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

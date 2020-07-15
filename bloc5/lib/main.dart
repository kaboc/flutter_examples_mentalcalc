import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bloc5/bloc/calc_bloc.dart';
import 'package:bloc5/model/calc_model.dart';
import 'package:bloc5/bloc/record_bloc.dart';
import 'package:bloc5/model/record_model.dart';
import 'package:bloc5/screen/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RecordBloc>(
          create: (context) => RecordBloc(
            recordModel: RecordModel(),
          ),
          dispose: (_, bloc) => bloc.dispose(),
        ),
        Provider<CalcBloc>(
          create: (context) => CalcBloc(
            calcModel: CalcModel(),
            recordBloc: context.read<RecordBloc>(),
          ),
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green).copyWith(
          textTheme: Theme.of(context).textTheme.copyWith(
                bodyText2: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 18.0),
              ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}

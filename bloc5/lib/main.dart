import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bloc5/bloc/calc_bloc.dart';
import 'package:bloc5/model/calc_model.dart';
import 'package:bloc5/model/record_model.dart';
import 'package:bloc5/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CalcModel>(
          create: (_) => CalcModel(),
        ),
        Provider<RecordModel>(
          create: (_) => RecordModel(),
        ),
        Provider<CalcBloc>(
          create: (context) => CalcBloc(locator: context.read),
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green).copyWith(
          textTheme: TextTheme(
            bodyText2:
                Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 18.0),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}

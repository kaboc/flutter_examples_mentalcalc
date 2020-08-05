import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc6/cubit/calc_cubit.dart';
import 'package:bloc6/cubit/record_cubit.dart';
import 'package:bloc6/model/calc_model.dart';
import 'package:bloc6/screen/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CalcCubit>(
          create: (context) => CalcCubit(
            calcModel: CalcModel(),
          ),
        ),
        BlocProvider<RecordCubit>(
          lazy: false,
          create: (context) => RecordCubit(
            calcCubit: context.bloc<CalcCubit>(),
          ),
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

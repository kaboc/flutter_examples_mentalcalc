import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc6/cubit/calc_cubit.dart';
import 'package:bloc6/cubit/record_cubit.dart';
import 'package:bloc6/screen/record.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalcCubit, CalcState>(
      buildWhen: (prevState, state) => state.status != prevState.status,
      builder: (_, state) => Scaffold(
        appBar: AppBar(
          title: const Text('Add up the numbers!'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.of(context).push(RecordScreen.route());
              },
            )
          ],
        ),
        body: Center(
          child: {
            ChallengeStatus.none: const _Init(),
            ChallengeStatus.challenge: const _Challenge(),
            ChallengeStatus.result: const _Result(),
          }[state.status],
        ),
        floatingActionButton: Visibility(
          visible: state.status != ChallengeStatus.challenge,
          child: FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () => context.bloc<CalcCubit>().challenge(),
          ),
        ),
      ),
    );
  }
}

class _Init extends StatelessWidget {
  const _Init();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tap on the button to\nstart your challenge.'),
    );
  }
}

class _Challenge extends StatelessWidget {
  const _Challenge();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalcCubit, CalcState>(
      buildWhen: (prevState, state) => state.number != prevState.number,
      builder: (_, state) {
        return state.number == 0
            ? const SizedBox.shrink()
            : Text(
                state.number.toString(),
                style: const TextStyle(fontSize: 48.0),
              );
      },
    );
  }
}

class _Result extends StatelessWidget {
  const _Result();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordCubit, RecordState>(
      buildWhen: (prevState, state) => state.sum != prevState.sum,
      builder: (_, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Answer'),
            Text(
              state.sum.toString(),
              style: const TextStyle(fontSize: 48.0),
            ),
          ],
        );
      },
    );
  }
}

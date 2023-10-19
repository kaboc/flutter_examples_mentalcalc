import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc6/cubit/calc_cubit.dart';
import 'package:bloc6/cubit/record_cubit.dart';
import 'package:bloc6/screen/record.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalcCubit, CalcState>(
      buildWhen: (prevState, state) => state.status != prevState.status,
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add up the numbers!'),
            actions: [
              IconButton(
                icon: const Icon(Icons.info),
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
              onPressed: () => context.read<CalcCubit>().challenge(),
              child: const Icon(Icons.play_arrow),
            ),
          ),
        );
      },
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
      buildWhen: (prevState, state) => state.index != prevState.index,
      builder: (_, state) {
        return state.index < 0
            ? const SizedBox.shrink()
            : Text(
                '${state.numbers[state.index]}',
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
          children: [
            const Text('Answer'),
            Text(
              '${state.sum}',
              style: const TextStyle(fontSize: 48.0),
            ),
          ],
        );
      },
    );
  }
}

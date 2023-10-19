import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bloc5/bloc/calc_bloc.dart';
import 'package:bloc5/bloc/record_bloc.dart';
import 'package:bloc5/screen/record.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.watch<CalcBloc>().status,
      initialData: ChallengeStatus.none,
      builder: (_, snapshot) {
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
            }[snapshot.data],
          ),
          floatingActionButton: Visibility(
            visible: snapshot.data != ChallengeStatus.challenge,
            child: FloatingActionButton(
              onPressed: () => context.read<CalcBloc>().start.add(null),
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
    return StreamBuilder(
      stream: context.watch<CalcBloc>().number,
      initialData: 0,
      builder: (_, snapshot) {
        return Visibility(
          visible: snapshot.data != 0,
          child: Text(
            '${snapshot.data}',
            style: const TextStyle(fontSize: 48.0),
          ),
        );
      },
    );
  }
}

class _Result extends StatelessWidget {
  const _Result();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.watch<RecordBloc>().record,
      initialData: RecordState.none,
      builder: (_, snapshot) {
        final data = snapshot.data!;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Answer'),
            Text(
              '${data.sum}',
              style: const TextStyle(fontSize: 48.0),
            ),
          ],
        );
      },
    );
  }
}

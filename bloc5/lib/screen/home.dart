import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bloc5/bloc/calc_bloc.dart';
import 'package:bloc5/bloc/record_bloc.dart';
import 'package:bloc5/screen/record.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ChallengeStatus>(
      stream: context.watch<CalcBloc>().status,
      initialData: ChallengeStatus.none,
      builder: (_, snapshot) => Scaffold(
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
          }[snapshot.data],
        ),
        floatingActionButton: Visibility(
          visible: snapshot.data != ChallengeStatus.challenge,
          child: FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () => context.read<CalcBloc>().start.add(null),
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
    return StreamBuilder<int>(
      stream: context.watch<CalcBloc>().number,
      initialData: 0,
      builder: (_, snapshot) {
        return snapshot.data == 0
            ? const SizedBox.shrink()
            : Text(
                snapshot.data.toString(),
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
    return StreamBuilder<RecordState>(
      stream: context.watch<RecordBloc>().record,
      initialData: RecordState.none,
      builder: (_, snapshot) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Answer'),
            Text(
              snapshot.data.sum.toString(),
              style: const TextStyle(fontSize: 48.0),
            ),
          ],
        );
      },
    );
  }
}

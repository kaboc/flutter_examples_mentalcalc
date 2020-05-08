import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bloc5/bloc/calc_bloc.dart';
import 'package:bloc5/record.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CalcBloc>(context);

    return StreamBuilder<CalcStatus>(
      stream: bloc.status,
      initialData: CalcStatus.stop,
      builder: (_, snapshot) => Scaffold(
        appBar: AppBar(
          title: const Text('Add up the numbers!'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () => Navigator.of(context).push(RecordScreen.route()),
            )
          ],
        ),
        body: Center(
          child: _Number(status: snapshot.data),
        ),
        floatingActionButton: Visibility(
          visible: snapshot.data == CalcStatus.stop,
          child: FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () => bloc.start.add(null),
          ),
        ),
      ),
    );
  }
}

class _Number extends StatelessWidget {
  const _Number({@required this.status});

  final CalcStatus status;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: Provider.of<CalcBloc>(context).onNextValue,
      initialData: 0,
      builder: (_, snapshot) => snapshot.data == 0
          ? const SizedBox.shrink()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (status == CalcStatus.stop) const Text('Answer'),
                Text(
                  snapshot.data.toString(),
                  style: const TextStyle(fontSize: 48.0),
                ),
              ],
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bloc5/bloc/record_bloc.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen();

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const RecordScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record'),
      ),
      body: SafeArea(
        child: Center(
          child: StreamBuilder<RecordState>(
            stream: context.watch<RecordBloc>().record,
            initialData: RecordState.none,
            builder: (_, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('You have tried ${snapshot.data.times} times.'),
                  const SizedBox(height: 36.0),
                  if (snapshot.data.numbers.isNotEmpty) ...[
                    const Text('Last challenge'),
                    const SizedBox(height: 8.0),
                    for (int v in snapshot.data.numbers) Text(v.toString()),
                    SizedBox(
                      width: 80.0,
                      child: Divider(color: Colors.black),
                    ),
                    Text(snapshot.data.sum.toString()),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

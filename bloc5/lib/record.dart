import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bloc5/bloc/calc_bloc.dart';
import 'package:bloc5/dto/record_data.dart';

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
          child: StreamBuilder<RecordData>(
            stream: Provider.of<CalcBloc>(context).record,
            initialData: RecordData.none,
            builder: (_, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('You have tried ${snapshot.data.times} times.'),
                  const SizedBox(height: 36.0),
                  if (snapshot.data.list.isNotEmpty) ...[
                    const Text('Last challenge:'),
                    ...snapshot.data.list
                        .map((v) => Text(v.toString()))
                        .toList(),
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

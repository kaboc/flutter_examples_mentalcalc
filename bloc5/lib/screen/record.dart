import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bloc5/bloc/record_bloc.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

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
          child: StreamBuilder(
            stream: context.watch<RecordBloc>().record,
            initialData: RecordState.none,
            builder: (_, snapshot) {
              final data = snapshot.data!;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You have tried ${data.times} times.'),
                  const SizedBox(height: 36.0),
                  if (data.numbers.isNotEmpty) ...[
                    const Text('Last challenge'),
                    const SizedBox(height: 8.0),
                    for (int v in data.numbers) Text('$v'),
                    const SizedBox(
                      width: 80.0,
                      child: Divider(color: Colors.black),
                    ),
                    Text('${data.sum}'),
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

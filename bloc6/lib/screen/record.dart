import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc6/cubit/record_cubit.dart';

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
          child: BlocBuilder<RecordCubit, RecordState>(
            builder: (_, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You have tried ${state.times} times.'),
                  const SizedBox(height: 36.0),
                  if (state.numbers.isNotEmpty) ...[
                    const Text('Last challenge'),
                    const SizedBox(height: 8.0),
                    for (int v in state.numbers) Text('$v'),
                    const SizedBox(
                      width: 80.0,
                      child: Divider(color: Colors.black),
                    ),
                    Text('${state.sum}'),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calc_bloc.dart';

class CalcScreen extends StatelessWidget {
  const CalcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CalcBloc>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _text(bloc),
            _button(bloc),
          ],
        ),
      ),
    );
  }

  Widget _text(CalcBloc bloc) {
    return StreamBuilder(
      stream: bloc.onAdd,
      builder: (context, snapshot) {
        return Text(
          snapshot.hasData ? snapshot.data! : '',
          style: const TextStyle(fontSize: 38.0),
        );
      },
    );
  }

  Widget _button(CalcBloc bloc) {
    return StreamBuilder(
      stream: bloc.onToggle,
      initialData: true,
      builder: (context, snapshot) {
        return Visibility(
          visible: snapshot.hasData && snapshot.data!,
          child: ElevatedButton(
            onPressed: () => bloc.start(),
            child: const Text('Start'),
          ),
        );
      },
    );
  }
}

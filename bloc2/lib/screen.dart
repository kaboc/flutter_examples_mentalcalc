import 'package:flutter/material.dart';
import 'calc_bloc.dart';

class CalcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CalcBloc>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
          snapshot.hasData ? snapshot.data : '',
          style: TextStyle(fontSize: 38.0),
        );
      },
    );
  }

  Widget _button(CalcBloc bloc) {
    return StreamBuilder(
      stream: bloc.onToggle,
      builder: (context, snapshot) {
        return Opacity(
          opacity: snapshot.hasData && snapshot.data ? 1.0 : 0.0,
          child: RaisedButton(
            child: const Text('スタート'),
            onPressed: () => bloc.start.add(null),
          ),
        );
      },
    );
  }
}

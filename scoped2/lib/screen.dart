import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calc_model.dart';

class CalcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _text(),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _text() {
    return Consumer<CalcModel>(
      builder: (_, model, __) {
        return Text(
          model.output,
          style: TextStyle(fontSize: 38.0),
        );
      },
    );
  }

  Widget _button() {
    return Consumer<CalcModel>(
      builder: (_, model, __) {
        return Opacity(
          opacity: model.isBtnVisible ? 1.0 : 0.0,
          child: RaisedButton(
            child: const Text('スタート'),
            onPressed: model.start,
          ),
        );
      },
    );
  }
}

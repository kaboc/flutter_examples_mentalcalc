import 'package:flutter/material.dart';
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
    return ScopedModelDescendant<CalcModel>(
      builder: (_, __, model) {
        return Text(
          model.output,
          style: const TextStyle(fontSize: 38.0),
        );
      },
    );
  }

  Widget _button() {
    return ScopedModelDescendant<CalcModel>(
      builder: (_, __, model) {
        return Opacity(
          opacity: model.isBtnVisible ? 1.0 : 0.0,
          child: RaisedButton(
            child: const Text('Start'),
            onPressed: model.start,
          ),
        );
      },
    );
  }
}

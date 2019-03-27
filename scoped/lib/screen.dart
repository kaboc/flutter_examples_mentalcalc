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
      builder: (context, child, model) {
        return Text(
          model.output,
          style: TextStyle(fontSize: 38.0),
        );
      },
    );
  }

  Widget _button() {
    return ScopedModelDescendant<CalcModel>(
      builder: (context, child, model) {
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

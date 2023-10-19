import 'package:flutter/material.dart';
import 'calc_model.dart';

class CalcScreen extends StatelessWidget {
  const CalcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
        return Visibility(
          visible: model.isBtnVisible,
          child: ElevatedButton(
            onPressed: model.start,
            child: const Text('Start'),
          ),
        );
      },
    );
  }
}

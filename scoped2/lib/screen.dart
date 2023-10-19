import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            _text(context),
            _button(context),
          ],
        ),
      ),
    );
  }

  Widget _text(BuildContext context) {
    final model = Provider.of<CalcModel>(context);

    return Text(
      model.output,
      style: const TextStyle(fontSize: 38.0),
    );
  }

  Widget _button(BuildContext context) {
    final model = Provider.of<CalcModel>(context, listen: false);

    return Visibility(
      visible: model.isBtnVisible,
      child: ElevatedButton(
        onPressed: model.start,
        child: const Text('Start'),
      ),
    );
  }
}

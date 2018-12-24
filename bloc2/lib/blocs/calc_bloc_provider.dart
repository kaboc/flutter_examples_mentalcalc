import 'package:flutter/widgets.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'calc_bloc.dart';
export 'calc_bloc.dart';

class CalcBlocProvider extends BlocProvider<CalcBloc> {
  CalcBlocProvider({
    @required Widget child,
  }) : super(
          child: child,
          creator: (context, _bag) {
            assert(context != null);
            return CalcBloc();
          },
        );

  static CalcBloc of(BuildContext context) => BlocProvider.of(context);
}

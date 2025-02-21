import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  

  @override
  void onChange(BlocBase bloc, Change change) {
   
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('${bloc.runtimeType} created');
  }
}
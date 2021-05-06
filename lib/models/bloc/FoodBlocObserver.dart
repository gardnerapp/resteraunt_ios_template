import 'package:flutter_bloc/flutter_bloc.dart';

class FoodBlocObserver extends BlocObserver{

  @override
  void onEvent(Bloc bloc, Object event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    // TODO: implement onChange
    super.onChange(cubit, change);
    print(change);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(cubit, error, stackTrace);
    print(error);
  }

}
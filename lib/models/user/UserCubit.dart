import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resteraunt_starter/models/user/user.dart';

class UserCubit extends Cubit<User>{
  UserCubit(User state) : super(state);


  login(User user) => emit(user);


  logout() => emit(null);

  user () => state;

}
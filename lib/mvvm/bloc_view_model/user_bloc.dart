import 'dart:developer';

import 'package:aplikasi_hello_world/mvvm/model/user.dart';
import 'package:bloc/bloc.dart';

class UserBloc extends Bloc<int, User> {
  @override
  User get initialState => UnitializedUser();

  @override
  Stream<User> mapEventToState(int event) async* {
    try {
      User user = await User.getUserFromAPI(event);
      yield user;
    } catch (e) {
      log(e.toString());
    }
  }
}

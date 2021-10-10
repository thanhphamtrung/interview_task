import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user/user_credential.dart';
import '../../../services/authen_service.dart/authen_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    // ignore: void_checks
    on<LoginUserChecked>((event, emit) async {
      var users = await AuthenService().getCredentialData();
      var userToCheck = event.user;
      for (UserCredential user in users as List<UserCredential>) {
        if (user.username == userToCheck.username &&
            user.password == userToCheck.password) {
          return emit(LoginSuccess());
        }
      }
      return emit(LoginFail());
    });
  }
}

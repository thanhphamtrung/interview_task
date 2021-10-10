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
      for (var user in users) {
        if (user.username == event.user.username &&
            user.password == event.user.password) {
          return emit(LoginSuccess());
        }
      }
      return emit(LoginFail());
    });
  }
}

// ignore: depend_on_referenced_packages, implementation_imports
import 'package:collection/src/iterable_extensions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user/user_credential.dart';
import '../../../services/authen_service.dart/authen_service.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterCheckUserExisted>((event, emit) async {
      var users = await AuthenService().getCredentialData();
      if (users.firstWhereOrNull((user) => user.username == event.username) !=
          null) {
        return emit(RegisterCheckUserExistedFail());
      }
    });
    on<RegisterAddNewUser>((event, emit) async {
      var users = await AuthenService().getCredentialData();
      users.add(event.user);
      bool _isAddSuccess = await AuthenService().addNewCredentialData(users);
      if (!_isAddSuccess) {
        return emit(RegisterAddNewUserFail());
      }
    });
  }
}

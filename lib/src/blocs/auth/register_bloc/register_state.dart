part of 'register_bloc.dart';

@immutable
abstract class RegisterState extends Equatable {}

class RegisterInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterCheckUserExistedFail extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterAddNewUserSuccess extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterAddNewUserFail extends RegisterState {
  @override
  List<Object?> get props => [];
}

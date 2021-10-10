part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent extends Equatable {}

class RegisterCheckUserExisted extends RegisterEvent {
  final String username;

  RegisterCheckUserExisted(this.username);
  @override
  List<Object?> get props => [username];
}

class RegisterAddNewUser extends RegisterEvent {
  final UserCredential user;

  RegisterAddNewUser(this.user);
  @override
  List<Object?> get props => [user];
}

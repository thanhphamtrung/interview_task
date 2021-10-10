part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class LoginUserChecked extends LoginEvent {
  final UserCredential user;

  LoginUserChecked(this.user);
  @override
  List<Object?> get props => [user];
}

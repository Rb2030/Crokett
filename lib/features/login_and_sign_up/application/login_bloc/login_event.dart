part of 'login_bloc.dart';

abstract class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();

  @override
  List<Object> get props => [];
}

// Email

class EmailChanged extends LoginBlocEvent {
  final String emailString;

  const EmailChanged({required this.emailString});

  @override
  List<Object> get props => [emailString];
  @override
  String toString() =>
  'EmailChanged {emailString: $emailString}';
}

// Password

class PasswordChanged extends LoginBlocEvent {
  final String passwordString;

  const PasswordChanged({required this.passwordString});

  @override
  List<Object> get props => [passwordString];
  @override
  String toString() =>
  'PasswordChanged {passwordString: $passwordString}';
}

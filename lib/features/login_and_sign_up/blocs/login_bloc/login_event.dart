part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

// Email

class EmailChanged extends LoginEvent {
  final String emailString;

  const EmailChanged({required this.emailString});

  @override
  List<Object> get props => [emailString];
  @override
  String toString() =>
  'EmailChanged {emailString: $emailString}';
}

// Password

class PasswordChanged extends LoginEvent {
  final String passwordString;

  const PasswordChanged({required this.passwordString});

  @override
  List<Object> get props => [passwordString];
  @override
  String toString() =>
  'PasswordChanged {passwordString: $passwordString}';
}

// LoginWithEmailAndPassword

class LoginWithEmailAndPassword extends LoginEvent {
  final String emailString;
  final String passwordString;

  const LoginWithEmailAndPassword({required this.emailString, required this.passwordString});

  @override
  List<Object> get props => [emailString, passwordString];
  @override
  String toString() =>
  'LoginWithEmailAndPassword {emailString: $emailString, passwordString: $passwordString}';
}

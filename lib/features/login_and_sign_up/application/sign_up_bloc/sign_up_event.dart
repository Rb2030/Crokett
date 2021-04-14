part of 'sign_up_bloc.dart';

abstract class SignUpBlocEvent extends Equatable {
  const SignUpBlocEvent();

  @override
  List<Object> get props => [];
}

// Email

class EmailChanged extends SignUpBlocEvent {
  final String emailString;

  const EmailChanged({required this.emailString});

  @override
  List<Object> get props => [emailString];
  @override
  String toString() =>
  'EmailChanged {emailString: $emailString}';
}

// Password

class PasswordChanged extends SignUpBlocEvent {
  final String passwordString;

  const PasswordChanged({required this.passwordString});

  @override
  List<Object> get props => [passwordString];
  @override
  String toString() =>
  'PasswordChanged {passwordString: $passwordString}';
}

// Password Confirmation

class PasswordConfirmationChanged extends SignUpBlocEvent {
  final String passwordConfirmationString;

  const PasswordConfirmationChanged({required this.passwordConfirmationString});

  @override
  List<Object> get props => [passwordConfirmationString];
  @override
  String toString() =>
  'PasswordConfirmationChanged {passwordConfirmationString: $passwordConfirmationString}';
}
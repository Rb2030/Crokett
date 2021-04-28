part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginBlocInitial extends LoginState {}

class SelectedLoginState extends LoginState {}

class SelectedGoogleSignInState extends LoginState {}

class SelectedSignUpState extends LoginState {}

class EmailTextFieldChanged extends LoginState {
  final EmailAddress emailAddress;

  EmailTextFieldChanged(this.emailAddress);

  @override
  List<Object> get props => [emailAddress];
}

class PasswordTextFieldChanged extends LoginState {
  final Password password;

  PasswordTextFieldChanged(this.password);

  @override
  List<Object> get props => [password];
}

class CheckingCredentials extends LoginState {}

part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginStateInitial extends LoginState {}

class SelectedLoginState extends LoginState {}

class SelectedGoogleSignInState extends LoginState {}

class SelectedAppleSignInState extends LoginState {}

class SelectedSignUpState extends LoginState {}

class EmailTextFieldChanged extends LoginState {
  final EmailAddress emailAddress;

  const EmailTextFieldChanged({required this.emailAddress});

  @override
  List<Object> get props => [emailAddress];
}

class PasswordTextFieldChanged extends LoginState {
  final Password password;

  const PasswordTextFieldChanged(this.password);

  @override
  List<Object> get props => [password];
}

class CheckingCredentials extends LoginState {
  final EmailAddress emailAddress;
  final Password password;

  const CheckingCredentials(
      {required this.emailAddress, required this.password});

  @override
  List<Object> get props => [emailAddress, password];
}

class LoginQueryReturn extends LoginState {
  final Option<Either<Failure, Unit>> authFailureOrSuccessOption;

  LoginQueryReturn(
      this.authFailureOrSuccessOption);

  @override
  List<Object> get props => [authFailureOrSuccessOption];
}

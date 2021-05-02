part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginStateInitial extends LoginState {}

class SelectedLoginState extends LoginState {}

class SelectedGoogleSignInState extends LoginState {}

class SelectedSignUpState extends LoginState {}

class EmailTextFieldChanged extends LoginState {
  final EmailAddress emailAddress;

  EmailTextFieldChanged({required this.emailAddress});

  @override
  List<Object> get props => [emailAddress];
}

class PasswordTextFieldChanged extends LoginState {
  final Password password;

  PasswordTextFieldChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class CheckingCredentials extends LoginState {
  final EmailAddress emailAddress;
  final Password password;

  CheckingCredentials(this.emailAddress, this.password);

  @override
  List<Object> get props => [emailAddress, password];
}

class LoginQueryReturn extends LoginState {
  final Option<Either<Failure, Unit>> authFailureOrSuccessOption;


  LoginQueryReturn(this.authFailureOrSuccessOption);

  @override
  List<Object> get props => [authFailureOrSuccessOption];
}

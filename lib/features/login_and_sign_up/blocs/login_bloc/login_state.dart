part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final EmailAddress emailAddress;
  final Password password;

  const LoginState({required this.emailAddress, required this.password});

  @override
  List<Object> get props => [emailAddress, password];
}

class LoginStateInitial extends LoginState {
  final EmailAddress emailAddress;
  final Password password;

  const LoginStateInitial({required this.emailAddress, required this.password})
      : super(emailAddress: emailAddress, password: password);

  @override
  List<Object> get props => [emailAddress, password];
}

class SelectedLoginState extends LoginState {
  final EmailAddress emailAddress;
  final Password password;

  const SelectedLoginState({required this.emailAddress, required this.password})
      : super(emailAddress: emailAddress, password: password);

  @override
  List<Object> get props => [emailAddress, password];
}

class SelectedGoogleSignInState extends LoginState {
  final EmailAddress emailAddress;
  final Password password;

  const SelectedGoogleSignInState(
      {required this.emailAddress, required this.password})
      : super(emailAddress: emailAddress, password: password);

  @override
  List<Object> get props => [emailAddress, password];
}

class SelectedSignUpState extends LoginState {
  final EmailAddress emailAddress;
  final Password password;

  const SelectedSignUpState(
      {required this.emailAddress, required this.password})
      : super(emailAddress: emailAddress, password: password);

  @override
  List<Object> get props => [emailAddress, password];
}

class EmailTextFieldChanged extends LoginState {
  final EmailAddress emailAddress;
  final Password password;

  const EmailTextFieldChanged(
      {required this.emailAddress, required this.password})
      : super(emailAddress: emailAddress, password: password);

  @override
  List<Object> get props => [emailAddress, password];
}

class PasswordTextFieldChanged extends LoginState {
  final EmailAddress emailAddress;
  final Password password;

  const PasswordTextFieldChanged(
      {required this.emailAddress, required this.password})
      : super(emailAddress: emailAddress, password: password);

  @override
  List<Object> get props => [emailAddress, password];
}

class CheckingCredentials extends LoginState {
  final EmailAddress emailAddress;
  final Password password;

  const CheckingCredentials(
      {required this.emailAddress, required this.password})
      : super(emailAddress: emailAddress, password: password);

  @override
  List<Object> get props => [emailAddress, password];
}

class LoginQueryReturn extends LoginState {
  final EmailAddress emailAddress;
  final Password password;
  final Option<Either<Failure, Unit>> authFailureOrSuccessOption;

  LoginQueryReturn(
      this.authFailureOrSuccessOption, this.emailAddress, this.password)
      : super(emailAddress: emailAddress, password: password);

  @override
  List<Object> get props => [authFailureOrSuccessOption];
}

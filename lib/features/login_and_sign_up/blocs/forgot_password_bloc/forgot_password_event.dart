part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

// Email

class EmailChanged extends ForgotPasswordEvent {
  final String emailString;

  const EmailChanged({required this.emailString});

  @override
  List<Object> get props => [emailString];
  @override
  String toString() =>
  'EmailChanged {emailString: $emailString}';
}

// ResetPassword

class ResetPassword extends ForgotPasswordEvent {
  final String emailString;

  const ResetPassword({required this.emailString});

  @override
  List<Object> get props => [emailString];
  @override
  String toString() =>
  'ResetPassword {emailString: $emailString}';
}

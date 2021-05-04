part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
  
  @override
  List<Object> get props => [];
}

class ForgotPasswordStateInitial extends ForgotPasswordState {}

class EmailTextFieldChanged extends ForgotPasswordState {
  final EmailAddress emailAddress;

  EmailTextFieldChanged({required this.emailAddress});

  @override
  List<Object> get props => [emailAddress];
}

class SendingEmailReset extends ForgotPasswordState {}

class EmailSentConfirmation extends ForgotPasswordState {
  final Option<Either<Failure, Unit>> emailSentReturn;

  EmailSentConfirmation(this.emailSentReturn);

  @override
  List<Object> get props => [emailSentReturn];
}
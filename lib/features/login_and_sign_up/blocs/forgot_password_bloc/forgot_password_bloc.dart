import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crokett/core/global/errors/failures.dart';
import 'package:crokett/features/login_and_sign_up/domain/auth_facade/i_auth_facade.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/email_address.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

@injectable
class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  String emailAddressString = '';
  EmailAddress emailAddress = EmailAddress('');
  bool bottomLoginButtonEnabled = false;
  final IAuthFacade _authFacade;
  ForgotPasswordBloc(this._authFacade) : super(ForgotPasswordStateInitial());
  
  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {

    if (event is EmailChanged) {
      emailAddressString = event.emailString;
      emailAddress = EmailAddress(event.emailString);
      yield EmailTextFieldChanged(emailAddress: emailAddress);
      emailAddress.value.fold((fail) => null, (success) {
          bottomLoginButtonEnabled = true;
      });
    }

    if (event is ResetPassword) {
      // This event can only be called if login button is enabled (which it won't be unless the Email is in the correct validated format)
      yield SendingEmailReset();
      yield* _sendPasswordChangeLinkToEmail(
        _authFacade.sendPasswordResetEmail,
      );
    }
  }

  Stream<ForgotPasswordState> _sendPasswordChangeLinkToEmail(
    Future<Either<Failure, Unit>> Function(
            {required EmailAddress emailAddress})
        forwardedCall,
  ) async* {
    Either<Failure, Unit> failureOrSuccess;
    final isEmailValid = EmailAddress(emailAddressString).isValid();

    if (isEmailValid) {

      failureOrSuccess = await forwardedCall(
          emailAddress: EmailAddress(emailAddressString));

      yield EmailSentConfirmation(optionOf(failureOrSuccess));
    }
  }
}

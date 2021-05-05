import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:crokett/core/global/errors/auth_failures.dart';
import 'package:crokett/core/global/errors/failures.dart';
import 'package:crokett/features/login_and_sign_up/domain/auth_facade/i_auth_facade.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/email_address.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/password.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  bool displayBottomSheet = false;
  String emailAddressString =
      ''; // These are both used to keep the string after minimising the login bottom sheet
  String passwordString =
      ''; // These are both used to keep the string after minimising the login bottom sheet
  EmailAddress emailAddress = EmailAddress('');
  Password password = Password('');
  final IAuthFacade _authFacade;
  bool bottomLoginButtonEnabled = false;
  bool showEmailError = false;
  bool showPasswordError = false;

  LoginBloc(this._authFacade)
      : super(LoginStateInitial(
            emailAddress: EmailAddress(''), password: Password('')));

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginSelected) {
      displayBottomSheet = true;
      yield SelectedLoginState(emailAddress: emailAddress, password: password);
    }
    if (event is RemoveBottomSheet) {
      displayBottomSheet = false;
      yield LoginStateInitial(emailAddress: emailAddress, password: password);
    }
    if (event is EmailChanged) {
      emailAddressString = event.emailString;
      emailAddress = EmailAddress(event.emailString);
      yield EmailTextFieldChanged(
          emailAddress: emailAddress, password: password);
      emailAddress.value.fold((fail) => showEmailError = true, (success) {
        showEmailError = false;
        password.value.fold((fail) => null, (success) {
          bottomLoginButtonEnabled = true;
        });
      });
    }
    if (event is PasswordChanged) {
      passwordString = event.passwordString;
      password = Password(event.passwordString);
      yield PasswordTextFieldChanged(
          emailAddress: emailAddress, password: password);
      password.value.fold((fail) => showPasswordError = true, (success) {
        showPasswordError = false;
        emailAddress.value.fold((fail) => null, (success) {
          bottomLoginButtonEnabled = true;
        });
      });
    }
    if (event is LoginWithEmailAndPassword) {
      // This event can only be called if login button is enabled (which it won't be unless the Email and Password are in the correct validated format)
      yield CheckingCredentials(
          emailAddress: EmailAddress(emailAddressString),
          password: Password(passwordString));
      yield* _performActionOnAuthFacadeWithEmailAndPassword(
        _authFacade.loginWithEmailAndPassword,
      );
    }
  }

  Stream<LoginState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<Failure, Unit>> Function(
            {@required EmailAddress emailAddress, @required Password password})
        forwardedCall,
  ) async* {
    Either<Failure, Unit> failureOrSuccess;
    final isEmailValid = EmailAddress(emailAddressString).isValid();
    final isPasswordValid = Password(passwordString).isValid();

    if (isEmailValid && isPasswordValid) {
      failureOrSuccess = await forwardedCall(
          emailAddress: EmailAddress(emailAddressString),
          password: Password(passwordString));

      yield LoginQueryReturn(
          optionOf(failureOrSuccess), emailAddress, password);
    }
  }
}

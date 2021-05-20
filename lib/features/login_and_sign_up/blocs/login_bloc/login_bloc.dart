import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:crokett/core/global/errors/failures.dart';
import 'package:crokett/features/login_and_sign_up/blocs/auth_bloc/auth_bloc.dart';
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
  String emailAddressString = ''; // Needed for textEditingController
  String passwordString = ''; // Needed for textEditingController
  EmailAddress emailAddress = EmailAddress('');
  Password password = Password('');
  final IAuthFacade _authFacade;
  final AuthBloc _authBloc;
  bool bottomLoginButtonEnabled = false;
  bool showEmailError = false;
  bool showPasswordError = false;
  bool usingGoogleToSignIn = false;

  LoginBloc(this._authFacade, this._authBloc) : super(LoginStateInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginSelected) {
      yield SelectedLoginState();
    }
    if (event is RemoveBottomSheet) {
      yield LoginStateInitial();
    }
    if (event is EmailChanged) {
      emailAddressString = event.emailString;
      emailAddress = EmailAddress(event.emailString);
      yield EmailTextFieldChanged(emailAddress: emailAddress);
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
      yield PasswordTextFieldChanged(password);
      password.value.fold((fail) => showPasswordError = true, (success) {
        showPasswordError = false;
        emailAddress.value.fold((fail) => null, (success) {
          bottomLoginButtonEnabled = true;
        });
      });
    }
    if (event is LoginWithEmailAndPassword) {
      usingGoogleToSignIn = false;

      yield CheckingCredentials(
          emailAddress: EmailAddress(emailAddressString),
          password: Password(passwordString));
      yield* _performActionOnAuthFacadeWithEmailAndPassword(
        _authFacade.loginWithEmailAndPassword,
      );
    }
    if (event is GoogleSignInSelected) {
      usingGoogleToSignIn = true;
      yield SelectedGoogleSignInState();
      yield* _performActionOnAuthFacadeWithEmailAndPassword(
        _authFacade.signInWithGoogle,
      );
    }
    if (event is AppleSignInSelected) {
      usingGoogleToSignIn = false;
    }
  }

  Stream<LoginState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<Failure, Unit>> Function(
            EmailAddress emailAddress, Password password)
        forwardedCall,
  ) async* {
    Either<Failure, Unit> failureOrSuccess;
    final isEmailValid = EmailAddress(emailAddressString).isValid();
    final isPasswordValid = Password(passwordString).isValid();

    if (isEmailValid && isPasswordValid || usingGoogleToSignIn == true) {
      failureOrSuccess = await forwardedCall(
          EmailAddress(emailAddressString), Password(passwordString));

      failureOrSuccess.fold(
        (failure) {
          _authBloc.add(AuthEventLoggedOut());
        },
        (success) {
          _authBloc.add(AuthEventLoggedIn());
          usingGoogleToSignIn = false;
        },
      );

      yield LoginQueryReturn(optionOf(failureOrSuccess));
    }
  }
}

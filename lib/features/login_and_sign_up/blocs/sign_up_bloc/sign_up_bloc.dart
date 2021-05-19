import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crokett/core/global/errors/failures.dart';
import 'package:crokett/features/login_and_sign_up/domain/auth_facade/i_auth_facade.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/country.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/email_address.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/password.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/postal_code.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  String emailAddressString = ''; // Needed for textEditingController
  String passwordString = ''; // Needed for textEditingController
  String passwordConfirmationString = ''; // Needed for textEditingController
  String countryString = ''; // Needed for textEditingController
  String postalCodeString = ''; // Needed for textEditingController
  EmailAddress emailAddress = EmailAddress('');
  Password password = Password('');
  Password passwordConfirm = Password('');
  Country country = Country('');
  PostalCode postalCode = PostalCode('');
  final IAuthFacade _authFacade;
  bool bottomCreateAccountEnabled = false;
  bool showEmailError = false;
  bool showPasswordError = false;
  bool showPasswordConfirmError = false;
  bool passwordsMatch = false;
  bool showCountryError = false;
  bool showPostalCodeError = false;
  bool bottomLoginButtonEnabled = false;

  SignUpBloc(this._authFacade) : super(SignUpStateInitial());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is EmailChanged) {
      emailAddressString = event.emailString;
      emailAddress = EmailAddress(event.emailString);
      yield EmailTextFieldStateChanged(emailAddress: emailAddress);
      emailAddress.value.fold((fail) => showEmailError = true, (success) {
        showEmailError = false;
        password.value.fold((fail) => null, (success) {
          passwordConfirm.value.fold((fail) => null, (success) {
            country.value.fold((fail) => null, (success) {
              postalCode.value.fold((fail) => null, (success) {
                bottomLoginButtonEnabled = true;
              });
            });
          });
        });
      });
    }

    if (event is PasswordChanged) {
      passwordString = event.passwordString;
      password = Password(event.passwordString);
      yield PasswordTextFieldStateChanged(password);
      password.value.fold((fail) => showPasswordError = true, (success) {
        showPasswordError = false;
        emailAddress.value.fold((fail) => null, (success) {
          passwordConfirm.value.fold((fail) => null, (success) {
            country.value.fold((fail) => null, (success) {
              postalCode.value.fold((fail) => null, (success) {
                bottomLoginButtonEnabled = true;
              });
            });
          });
        });
      });
    }

    if (event is PasswordConfirmationChanged) {
      passwordConfirmationString = event.passwordConfirmationString;
      passwordConfirm = Password(event.passwordConfirmationString);
      yield PasswordConfirmationTextFieldStateChanged(passwordConfirm);
      passwordConfirm.value.fold((fail) => showPasswordConfirmError = true,
          (success) {
        passwordString == passwordConfirmationString
            ? passwordsMatch = true
            : passwordsMatch = false;
        showPasswordConfirmError = false;
        emailAddress.value.fold((fail) => null, (success) {
          password.value.fold((fail) => null, (success) {
            country.value.fold((fail) => null, (success) {
              postalCode.value.fold((fail) => null, (success) {
                bottomLoginButtonEnabled = true;
              });
            });
          });
        });
      });
    }

    if (event is CountryDropDownChanged) {
      countryString = event.countryString;
      country = Country(event.countryString);
      yield CountryDropDownStateChanged(event.countryString);
      country.value.fold((fail) => showCountryError = true, (success) {
        showCountryError = false;
        emailAddress.value.fold((fail) => null, (success) {
          password.value.fold((fail) => null, (success) {
            passwordConfirm.value.fold((fail) => null, (success) {
              postalCode.value.fold((fail) => null, (success) {
                bottomLoginButtonEnabled = true;
              });
            });
          });
        });
      });
    }

    if (event is PostalCodeChanged) {
      postalCodeString = event.postalCode;
      postalCode = PostalCode(event.postalCode);
      yield PostalCodeTextFieldStateChanged(event.postalCode);
      postalCode.value.fold((fail) => showPostalCodeError = true, (success) {
        showPostalCodeError = false;
        emailAddress.value.fold((fail) => null, (success) {
          password.value.fold((fail) => null, (success) {
            country.value.fold((fail) => null, (success) {
              postalCode.value.fold((fail) => null, (success) {
                bottomLoginButtonEnabled = true;
              });
            });
          });
        });
      });
    }

    if (event is SignUpNewUser) {
      yield SubmittingSignUpNewUserState(
          emailString: emailAddressString,
          passwordString: passwordString,
          passwordConfirmationString: passwordConfirmationString,
          countryString: countryString,
          postalCodeString: postalCodeString,
      );
      yield* _performActionOnAuthFacadeWithEmailAndPassword(
        _authFacade.signUpWithEmailAndPassword,
      );
    }
  }

  Stream<SignUpState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<Failure, Unit>> Function(
            {required EmailAddress emailAddress, required Password password})
        forwardedCall,
  ) async* {
    Either<Failure, Unit> failureOrSuccess;
    final isEmailValid = EmailAddress(emailAddressString).isValid();
    final isPasswordValid = Password(passwordString).isValid();

    if (isEmailValid && isPasswordValid) {
      failureOrSuccess =
          await forwardedCall(emailAddress: emailAddress, password: password);

      yield SignUpStateReturn(optionOf(failureOrSuccess));
    }
  }
}

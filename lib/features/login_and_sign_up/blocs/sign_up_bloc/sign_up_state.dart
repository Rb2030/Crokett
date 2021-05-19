part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
  
  @override
  List<Object> get props => [];
}

class SignUpStateInitial extends SignUpState {}

class EmailTextFieldStateChanged extends SignUpState {
  final EmailAddress emailAddress;

  const EmailTextFieldStateChanged({required this.emailAddress});

  @override
  List<Object> get props => [emailAddress];
}

class PasswordTextFieldStateChanged extends SignUpState {
  final Password password;

  const PasswordTextFieldStateChanged(this.password);

  @override
  List<Object> get props => [password];
}

class PasswordConfirmationTextFieldStateChanged extends SignUpState {
  final Password password;

  const PasswordConfirmationTextFieldStateChanged(this.password);

  @override
  List<Object> get props => [password];
}

class CountryDropDownStateChanged extends SignUpState {
  final String country;

  const CountryDropDownStateChanged(this.country);

  @override
  List<Object> get props => [country];
}

class PostalCodeTextFieldStateChanged extends SignUpState {
  final String postalCode;

  const PostalCodeTextFieldStateChanged(this.postalCode);

  @override
  List<Object> get props => [postalCode];
}

// SignUp

class SubmittingSignUpNewUserState extends SignUpState {
  final String emailString;
  final String passwordString;
  final String passwordConfirmationString;
  final String countryString;
  final String postalCodeString;

  const SubmittingSignUpNewUserState(
      {required this.emailString,
      required this.passwordString,
      required this.passwordConfirmationString,
      required this.countryString,
      required this.postalCodeString});

  @override
  List<Object> get props => [
        emailString,
        passwordString,
        passwordConfirmationString,
        countryString,
        postalCodeString
      ];
}

// Return

class SignUpStateReturn extends SignUpState {
  final Option<Either<Failure, Unit>> createUserFailureOrSuccessOption;

  SignUpStateReturn(this.createUserFailureOrSuccessOption);

  @override
  List<Object> get props => [createUserFailureOrSuccessOption];

}
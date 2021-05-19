part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

// Email

class EmailChanged extends SignUpEvent {
  final String emailString;

  const EmailChanged({required this.emailString});

  @override
  List<Object> get props => [emailString];
  @override
  String toString() => 'EmailChanged {emailString: $emailString}';
}

// Password

class PasswordChanged extends SignUpEvent {
  final String passwordString;

  const PasswordChanged({required this.passwordString});

  @override
  List<Object> get props => [passwordString];
  @override
  String toString() => 'PasswordChanged {passwordString: $passwordString}';
}

// Password Confirmation

class PasswordConfirmationChanged extends SignUpEvent {
  final String passwordConfirmationString;

  const PasswordConfirmationChanged({required this.passwordConfirmationString});

  @override
  List<Object> get props => [passwordConfirmationString];
  @override
  String toString() =>
      'PasswordConfirmationChanged {passwordConfirmationString: $passwordConfirmationString}';
}

// Country

class CountryDropDownChanged extends SignUpEvent {
  final String countryString;

  const CountryDropDownChanged({required this.countryString});

  @override
  List<Object> get props => [countryString];
  @override
  String toString() =>
      'CountryDropDownChanged {countryDropDownChanged: $countryString}';
}

// PostalCode

class PostalCodeChanged extends SignUpEvent {
  final String postalCode;

  const PostalCodeChanged({required this.postalCode});

  @override
  List<Object> get props => [postalCode];
  @override
  String toString() => 'PostalCodeChanged {postalCodeChanged: $postalCode}';
}

// SignUp

class SignUpNewUser extends SignUpEvent {}

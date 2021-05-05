import 'package:crokett/core/global/constants/constants.dart';

import 'failures.dart';

abstract class AuthFailure extends Failure {
  final String errorMessage;

  AuthFailure(this.errorMessage) : super('Error');
}

// Authorisation Failures

class CancelledByUser extends AuthFailure {

  CancelledByUser() : super(Constants.failureCancelledByUser);
}

//

class EmailAlreadyInUse extends AuthFailure {

  EmailAlreadyInUse() : super(Constants.failureEmailAlreadyInUse);
}

//

class UsernameAlreadyInUse extends AuthFailure {

  UsernameAlreadyInUse() : super(Constants.failureUsernameAlreadyInUse);
}

//

class InvalidEmailAndPasswordCombination extends AuthFailure {

  InvalidEmailAndPasswordCombination() : super(Constants.failureInvalidEmailAndPasswordCombination);
}

//

class NotAuthenticated extends AuthFailure {

  NotAuthenticated() : super(Constants.failureNotAuthenticated);
}
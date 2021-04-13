import 'package:crokett/core/global/constants/constants.dart';

abstract class Failure extends Error {
  final String errorMessage;

  Failure(this.errorMessage);
}

// General Failures

class ServerFailure extends Failure {

  ServerFailure() : super(Constants.errorServer);
}

//

class CacheFailure extends Failure {

  CacheFailure() : super(Constants.errorCache);
}

//

class InvalidEmail extends Failure {

  InvalidEmail() : super(Constants.errorInvalidEmail);
}

//

class InvalidPassword extends Failure {

  InvalidPassword() : super(Constants.errorInvalidPassword);
}

//

class InvalidUsername extends Failure {

  InvalidUsername() : super(Constants.errorInvalidUsername);
}

//

class ExceedingLength extends Failure {

  ExceedingLength() : super(Constants.errorExceedingLength);
}

//

class EmptyField extends Failure {

  EmptyField() : super(Constants.errorEmptyField);
}

//

class ContainsProfanity extends Failure {

  ContainsProfanity() : super(Constants.errorContainsProfanity);
}

//

class UnexpectedValueFailure {

  final Failure valueFailure;

  UnexpectedValueFailure(this.valueFailure);

  @override
  String toString() {
    const explanation = 'Encountered a Failure at an unrecoverable point. Terminating.';
    return Error.safeToString(
        '$explanation Failure was: ${valueFailure.errorMessage}',
    );
  }
}

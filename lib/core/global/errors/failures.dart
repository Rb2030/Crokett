import 'package:crokett/core/global/constants/constants.dart';

abstract class Failure extends Error {
  final String errorMessage;

  Failure(this.errorMessage);
}

// General Failures

class ServerFailure extends Failure {

  ServerFailure() : super(Constants.failureServer);
}

//

class CacheFailure extends Failure {

  CacheFailure() : super(Constants.failureCache);
}

//

class InvalidEmail extends Failure {

  InvalidEmail() : super(Constants.failureInvalidEmail);
}

//

class InvalidPassword extends Failure {

  InvalidPassword() : super(Constants.failureInvalidPassword);
}

//

class InvalidUsername extends Failure {

  InvalidUsername() : super(Constants.failureInvalidUsername);
}

//

class ExceedingLength extends Failure {

  ExceedingLength() : super(Constants.failureExceedingLength);
}

//

class EmptyField extends Failure {

  EmptyField() : super(Constants.failureEmptyField);
}

//

class ContainsProfanity extends Failure {

  ContainsProfanity() : super(Constants.failureContainsProfanity);
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

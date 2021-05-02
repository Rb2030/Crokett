import 'package:crokett/core/global/errors/failures.dart';
import 'package:crokett/core/global/value_objects/value_object.dart';
import 'package:crokett/core/global/value_objects/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<Failure, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(//This is being called by the private const below
        validateEmailAddress(input)
            .flatMap((_) => validateStringNotEmpty(input))
            .flatMap((_) => validateMaxStringLength(input)),
    );
  }

  const EmailAddress._(this.value);
  
}

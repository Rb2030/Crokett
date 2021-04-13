import 'package:crokett/core/global/errors/failures.dart';
import 'package:crokett/core/global/value_objects/value_object.dart';
import 'package:crokett/core/global/value_objects/value_validators.dart';
import 'package:dartz/dartz.dart';

class Password extends ValueObject<String> {
  final Either<Failure, String> value;

  factory Password(String input) {
    // This prevents the email constructor being called if the email isn't in the correct format
       return Password._(
        validatePassword(input).flatMap(
          (_) => validateStringNotEmpty(input)).flatMap(
            (_) => validateMaxStringLength(input))
      );
  }

  const Password._(this.value);
}
import 'package:crokett/core/global/errors/failures.dart';
import 'package:crokett/core/global/value_objects/value_object.dart';
import 'package:crokett/core/global/value_objects/value_validators.dart';
import 'package:dartz/dartz.dart';

class PostalCode extends ValueObject<String> {
  @override
  final Either<Failure, String> value;

  factory PostalCode(String input) {
    // This prevents the email constructor being called if the country isn't in the correct format
       return PostalCode._(
        validateStringNotEmpty(input).flatMap(
          (_) => validatePostCode(input))
      );
  }

  const PostalCode._(this.value);
}
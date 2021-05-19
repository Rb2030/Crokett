import 'package:crokett/core/global/errors/failures.dart';
import 'package:crokett/core/global/value_objects/value_object.dart';
import 'package:crokett/core/global/value_objects/value_validators.dart';
import 'package:dartz/dartz.dart';

class Country extends ValueObject<String> {
  @override
  final Either<Failure, String> value;

  factory Country(String input) {
    // This prevents the email constructor being called if the country isn't in the correct format
       return Country._(
        validateStringNotEmpty(input).flatMap(
          (_) => validateCountry(input))
      );
  }

  const Country._(this.value);
}
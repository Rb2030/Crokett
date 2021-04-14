import 'package:crokett/core/global/errors/failures.dart';
import 'package:crokett/core/global/value_objects/value_object.dart';
import 'package:crokett/core/global/value_objects/value_validators.dart';
import 'package:dartz/dartz.dart';

class Username extends ValueObject<String> {
  @override
  final Either<Failure, String> value;

  factory Username(String input) {

    return Username._(
        validateUsername(input).flatMap(
          (_) => validateStringNotEmpty(input)).flatMap(
          (_) => validateStringForProfanity(input)));
  }

  const Username._(this.value);
}
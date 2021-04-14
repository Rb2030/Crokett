import 'package:crokett/core/global/errors/auth_failures.dart';
import 'package:crokett/core/global/value_objects/value_object.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

class UniqueId extends ValueObject<String> {
  @override
  final Either<AuthFailure, String> value;

  factory UniqueId() {
    return UniqueId._(
      right(Uuid().v1()),
    );
  }

  factory UniqueId.fromUniqueString(String? uniqueId) {
    return UniqueId._(
      right(uniqueId!),
    );
  }

  const UniqueId._(this.value);
}
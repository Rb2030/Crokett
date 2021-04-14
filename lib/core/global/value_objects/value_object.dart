import 'package:crokett/core/global/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<Failure, T> get value;

  /// Throws [UnexpectedFailureError] containing the [ValueFailure]
  T getOrCrash() {
    return value.fold((f) => throw UnexpectedValueFailure(f), (r) => r);
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value(value: $value)';
}
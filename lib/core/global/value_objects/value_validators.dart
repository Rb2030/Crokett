import 'package:crokett/core/global/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:profanity_filter/profanity_filter.dart';

Either<Failure, String> validateEmailAddress(String input) {
  const pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final RegExp regExp = RegExp(pattern);

  if (input.length >= 6 && regExp.hasMatch(input)) {
    return right(input);
  } else {
    return left(InvalidEmail());
  }
}

Either<Failure, String> validatePassword(String input) {
  const pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  final RegExp regExp = RegExp(pattern);

  if (input.length >= 6 && regExp.hasMatch(input)) {
    return right(input);
  } else {
    return left(InvalidPassword());
  }
}

Either<Failure, String> validateUsername(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(InvalidUsername());
  }
}

Either<Failure, String> validateMaxStringLength(String input) {
  const maxLength = 28;
  if (input.length < maxLength) {
    return right(input);
  } else {
    return left(ExceedingLength());
  }
}

Either<Failure, String> validateStringForProfanity(String input) {
  final filter = ProfanityFilter();
  final bool hasProfanity = filter.hasProfanity(input);
  if (!hasProfanity) {
    return right(input);
  } else {
    return left(ContainsProfanity());
  }
}

Either<Failure, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(EmptyField());
  }
}

Either<Failure, String> validateCountry(String input) {
  List<String> countries = [
    "U.K",
    "Germany",
    "France",
    "Switzerland",
    "Italy",
    "Spain",
    "Portugal",
    "Denmark",
    "Sweden",
    "Austria",
    "Norway",
    "Ireland"
  ];

  if (countries.contains(input)) {
    return right(input);
  } else {
    return left(EmptyField());
  }
}

Either<Failure, String> validatePostCode(String input) {
  const pattern = // This is regex for Germany only (will need to add regex for other countries if we expand)
        r'\b((?:0[1-46-9]\d{3})|(?:[1-357-9]\d{4})|(?:[4][0-24-9]\d{3})|(?:[6][013-9]\d{3}))\b';
  final RegExp regExp = RegExp(pattern);

  if (input.length >= 6 && regExp.hasMatch(input)) {
    return right(input);
  } else {
    return left(InvalidEmail());
  }
}


import 'package:crokett/core/global/errors/auth_failures.dart';
import 'package:crokett/core/global/errors/failures.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/email_address.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/password.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/user.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/username.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract class IAuthFacade {
  Future<Either<Failure, Unit>> loginWithEmailAndPassword({ // Unit is the same as void
    @required EmailAddress emailAddress,
    @required Password password
  });

  Future<Either<Failure, Unit>> signUpWithEmailAndPassword({ // Unit is the same as void
    @required EmailAddress emailAddress,
    @required Password password
  });

  Future<Either<Failure, Unit>> signInWithGoogle(); // Unit is the same as void

  Future<Option<CurrentUser>> getSignedInUser();

  Future<Either<Failure, Unit>> uniqueUsernameCheck({
    @required Username username,
  });

 // Future<void> oiDeleteUserBruv();  //Used this to delete user after signing in

  Future<void> signOut();

}
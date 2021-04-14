import 'package:crokett/core/global/errors/auth_failures.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/email_address.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/password.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> loginWithEmailAndPassword({ // Unit is the same as void
    @required EmailAddress emailAddress,
    @required Password password
  });

  Future<Either<AuthFailure, Unit>> signUpWithEmailAndPassword({ // Unit is the same as void
    @required EmailAddress emailAddress,
    @required Password password
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle(); // Unit is the same as void

  Future<Option<CurrentUser>> getSignedInUser();

 // Future<void> oiDeleteUserBruv();  //Used this to delete user after signing in
  Future<void> signOut();

}
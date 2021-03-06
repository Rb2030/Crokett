import 'package:crokett/core/global/errors/auth_failures.dart';
import 'package:crokett/core/global/errors/failures.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/email_address.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/password.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/user.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/username.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract class IAuthFacade {
  Future<Either<Failure, Unit>> loginWithEmailAndPassword( // Unit is the same as void
    EmailAddress emailAddress,
    Password password
  );

  Future<Either<Failure, Unit>> signUpWithEmailAndPassword({ // Unit is the same as void
    @required EmailAddress emailAddress,
    @required Password password
  });

  Future<Either<Failure, Unit>> signInWithGoogle(EmailAddress emailAddress, Password password /* Params, not used, just for bloc fun call*/); // Unit is the same as void

  Future<Option<CurrentUser>> getSignedInUser();

  Future<Either<Failure, Unit>> sendPasswordResetEmail({@required EmailAddress emailAddress});

  Future<Either<Failure, Unit>> uniqueUsernameCheck({  // Unit is the same as void
    @required Username username,
  });

 // Future<void> oiDeleteUserBruv();  //Used this to delete user after signing in

  Future<void> signOut();

}
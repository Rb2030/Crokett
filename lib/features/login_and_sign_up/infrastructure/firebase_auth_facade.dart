import 'package:crokett/core/global/errors/auth_failures.dart';
import 'package:crokett/core/global/errors/failures.dart';
import 'package:crokett/features/login_and_sign_up/domain/auth_facade/i_auth_facade.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/email_address.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/password.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/user.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/username.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import './firebase_user_mapper.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
  );

  @override
  Future<Option<CurrentUser>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

//   @override
// Future<void> oiDeleteUserBruv() async =>
//     _firebaseAuth.currentUser?.delete();  //Used this to delete user after signing in

  @override
  Future<Either<Failure, Unit>> signUpWithEmailAndPassword({
    @required EmailAddress? emailAddress,
    @required Password? password,
  }) async {
    final emailAddressString = emailAddress!.getOrCrash();
    final passwordString = password!.getOrCrash();
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailAddressString, password: passwordString);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(EmailAlreadyInUse());
      } else {
        return left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> uniqueUsernameCheck(
      {@required Username? username}) async {
    final usernameString = username!.getOrCrash();
    // try {
    //   await
    // }
    throw UnimplementedError(); // TODO:--- Need to check Firebase for unique username id.
  }

  @override
  Future<Either<Failure, Unit>> loginWithEmailAndPassword({
    @required EmailAddress? emailAddress,
    @required Password? password,
  }) async {
    final emailAddressString = emailAddress!.getOrCrash();
    final passwordString = password!.getOrCrash();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAddressString, password: passwordString);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'error-wrong-password' ||
          e.code == 'error-user-not-found') {
        return left(InvalidEmailAndPasswordCombination());
      } else {
        return left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        CancelledByUser();
      }
      final googleAuthentication = await googleUser!.authentication;
      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );
      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((r) => right(unit));
    } on PlatformException catch (_) {
      return left(ServerFailure());
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}

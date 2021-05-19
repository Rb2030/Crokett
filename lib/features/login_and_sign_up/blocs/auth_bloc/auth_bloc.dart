import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:crokett/features/login_and_sign_up/domain/auth_facade/i_auth_facade.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  IAuthFacade authRepo;
  bool userSignedIn = false;

  AuthBloc(this.authRepo) : super(Uninitialized());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      yield AuthenticationLoading();
      Option<CurrentUser> user = await authRepo.getSignedInUser();
      yield user.fold(() {
        userSignedIn = false;
        // Hive
        return Unauthenticated();
      }, (user) {
        userSignedIn = true;
        // Hive
        return Authenticated(user);
      });
    }

    if (event is SplashAnimationFinished) {
      yield AuthStateSplashAnimationFinished(userSignedIn);
    }

    if (event is AuthEventLoggedOut) {
      authRepo.signOut();
      yield Unauthenticated();

      ///TODO: clear hive here??
    }

    if (event is AuthEventLoggedIn) {
      Option<CurrentUser> user = await authRepo.getSignedInUser();
      yield user.fold(() {
        userSignedIn = false;
          // Clear user from hive here ??
        return Unauthenticated();
      }, (user) {
        userSignedIn = true;
        // Add user to hive here ??
        return Authenticated(user);
      });

      ///TODO: clear hive here??
    }
  }
}

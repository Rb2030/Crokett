import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:crokett/features/home/page_structures/home_page.dart';
import 'package:crokett/features/login_and_sign_up/domain/auth_facade/i_auth_facade.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/user.dart';
import 'package:crokett/features/login_and_sign_up/page_structures/login_page.dart';
import 'package:crokett/routes/crokett_configuration.dart';
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
        return Unauthenticated();
      }, (user) {
        userSignedIn = true;
        return Authenticated(user);
      });
    }

    if (event is AuthEventLoggedOut) {
      authRepo.signOut();

      ///TODO: clear hive here??
    }
  }
}

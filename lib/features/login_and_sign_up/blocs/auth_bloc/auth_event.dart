part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {

  @override
  List<Object> get props => [];

}

//
class AppStarted extends AuthEvent {}

//
class SplashAnimationFinished extends AuthEvent {}

//
class AuthEventLoggedOut extends AuthEvent {}

//
class AuthEventLoggedIn extends AuthEvent {}

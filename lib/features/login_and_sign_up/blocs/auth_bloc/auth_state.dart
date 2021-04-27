part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {

  @override
  List<Object> get props => [];

}

//
class Uninitialized extends AuthState {}

//
class Authenticated extends AuthState {
  final CurrentUser user;
  Authenticated(this.user);
}

//
class Unauthenticated extends AuthState {}

//
class AuthenticationLoading extends AuthState {}


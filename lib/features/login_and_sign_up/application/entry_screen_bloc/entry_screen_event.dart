part of 'entry_screen_bloc.dart';

abstract class EntryScreenEvent extends Equatable {
  const EntryScreenEvent();

  @override
  List<Object> get props => [];
}

// Login

class LoginPressed extends EntryScreenEvent {}

// SignUp

class SignUpPressed extends EntryScreenEvent {}

// Google Sign In

class GoogleSignInPressed extends EntryScreenEvent {}


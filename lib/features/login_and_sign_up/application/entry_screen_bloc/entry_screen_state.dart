part of 'entry_screen_bloc.dart';

abstract class EntryScreenState extends Equatable {
  const EntryScreenState();
  
  @override
  List<Object> get props => [];
}

class EntryScreenInitial extends EntryScreenState {}

// Login

class DisplayingLoginScreen extends EntryScreenEvent {}

// SignUp

class DisplayingSignUpScreen extends EntryScreenEvent {}

// Google Sign In

class DisplayingGoogleSignInScreen extends EntryScreenEvent {}



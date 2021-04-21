part of 'google_sign_in_bloc.dart';

abstract class GoogleSignInState extends Equatable {
  const GoogleSignInState();
  
  @override
  List<Object> get props => [];
}

class GoogleSignInInitial extends GoogleSignInState {}

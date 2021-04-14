part of 'sign_up_bloc.dart';

abstract class SignUpBlocState extends Equatable {
  const SignUpBlocState();
  
  @override
  List<Object> get props => [];
}

class SignUpBlocInitial extends SignUpBlocState {}

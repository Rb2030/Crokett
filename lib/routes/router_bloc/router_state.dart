part of 'router_bloc.dart';

abstract class RouterState extends Equatable {
  const RouterState();
  
  @override
  List<Object> get props => [];
}

class RouterInitial extends RouterState {}

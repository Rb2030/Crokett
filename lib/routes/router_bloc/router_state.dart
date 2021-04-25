part of 'router_bloc.dart';

abstract class RouterState extends Equatable {
  const RouterState();
  
  @override
  List<Object> get props => [];
}

class RouterInitial extends RouterState {}

class ChangingRoute extends RouterState {}

class ChangedRoute extends RouterState {

  final List<Page> pages;

  ChangedRoute({required this.pages});

  @override
  List<Object> get props => [pages];
}

// Should have the page param passed in changing route
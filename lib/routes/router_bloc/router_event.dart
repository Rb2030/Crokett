part of 'router_bloc.dart';

abstract class RouterEvent extends Equatable {
  const RouterEvent();

  @override
  List<Object> get props => [];
}

class RouterEventNewPage extends RouterEvent {
  final List<Page> pages;

  RouterEventNewPage({required this.pages});

  @override
  List<Object> get props => [pages];
}

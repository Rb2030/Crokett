part of 'router_bloc.dart';

abstract class RouterEvent extends Equatable {
  const RouterEvent();

  @override
  List<Object> get props => [];
}

class RouterEventNewPage extends RouterEvent {
  final Page page;
  
  RouterEventNewPage({required this.page});

  @override
  List<Object> get props => [page];
}

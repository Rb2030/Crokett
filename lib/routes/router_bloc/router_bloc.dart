import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'router_event.dart';
part 'router_state.dart';

@injectable
class RouterBloc extends Bloc<RouterEvent, RouterState> {
  Page? page;
  RouterBloc() : super(RouterInitial());

  @override
  Stream<RouterState> mapEventToState(
    RouterEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

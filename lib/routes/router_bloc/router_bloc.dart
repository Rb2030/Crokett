import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:crokett/features/splash_screen/page_structures/splash_page.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'router_event.dart';
part 'router_state.dart';

@injectable
class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc() : super(RouterInitial());

  @override
  Stream<RouterState> mapEventToState(
    RouterEvent event,
  ) async* {
    if (event is RouterEventNewPage) {
      yield ChangingRoute();
      yield ChangedRoute(pages: event.pages);
    }
  }
}

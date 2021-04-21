import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cookshop_event.dart';
part 'cookshop_state.dart';

class CookshopBloc extends Bloc<CookshopEvent, CookshopState> {
  CookshopBloc() : super(CookshopInitial());

  @override
  Stream<CookshopState> mapEventToState(
    CookshopEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

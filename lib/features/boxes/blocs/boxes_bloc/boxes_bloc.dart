import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'boxes_event.dart';
part 'boxes_state.dart';

class BoxesBloc extends Bloc<BoxesEvent, BoxesState> {
  BoxesBloc() : super(BoxesInitial());

  @override
  Stream<BoxesState> mapEventToState(
    BoxesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

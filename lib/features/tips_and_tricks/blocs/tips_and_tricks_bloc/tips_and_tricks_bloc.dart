import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tips_and_tricks_event.dart';
part 'tips_and_tricks_state.dart';

class TipsAndTricksBloc extends Bloc<TipsAndTricksEvent, TipsAndTricksState> {
  TipsAndTricksBloc() : super(TipsAndTricksInitial());

  @override
  Stream<TipsAndTricksState> mapEventToState(
    TipsAndTricksEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

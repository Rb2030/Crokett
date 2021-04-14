import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'entry_screen_event.dart';
part 'entry_screen_state.dart';

class EntryScreenBloc extends Bloc<EntryScreenEvent, EntryScreenState> {
  EntryScreenBloc() : super(EntryScreenInitial());

  @override
  Stream<EntryScreenState> mapEventToState(
    EntryScreenEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

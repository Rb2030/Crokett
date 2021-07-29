import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'help_event.dart';
part 'help_state.dart';

@injectable
class HelpBloc extends Bloc<HelpEvent, HelpState> {
  HelpBloc() : super(HelpInitial());

  @override
  Stream<HelpState> mapEventToState(
    HelpEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

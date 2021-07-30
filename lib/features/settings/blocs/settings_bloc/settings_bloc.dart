import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial());

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

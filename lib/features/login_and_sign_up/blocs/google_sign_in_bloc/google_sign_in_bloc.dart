import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'google_sign_in_event.dart';
part 'google_sign_in_state.dart';

class GoogleSignInBloc extends Bloc<GoogleSignInEvent, GoogleSignInState> {
  GoogleSignInBloc() : super(GoogleSignInInitial());

  @override
  Stream<GoogleSignInState> mapEventToState(
    GoogleSignInEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

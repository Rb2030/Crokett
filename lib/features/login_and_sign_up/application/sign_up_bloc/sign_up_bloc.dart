import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBlocBloc extends Bloc<SignUpBlocEvent, SignUpBlocState> {
  SignUpBlocBloc() : super(SignUpBlocInitial());

  @override
  Stream<SignUpBlocState> mapEventToState(
    SignUpBlocEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

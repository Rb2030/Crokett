import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/email_address.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/password.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginStateInitial());
  bool displayBottomSheet = false;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginSelected) {
      displayBottomSheet = true;
      yield SelectedLoginState();
    }
    if (event is RemoveBottomSheet) {
      displayBottomSheet = false;
      yield LoginStateInitial();
    }
  }
}

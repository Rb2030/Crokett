import 'package:crokett/features/login_and_sign_up/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:crokett/features/login_and_sign_up/page_widgets/mobile/forgot_password_screen.dart';
import 'package:crokett/features/login_and_sign_up/page_widgets/mobile/sign_up_screen.dart';
import 'package:crokett/injection.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends Page {
  final Function(String) nextScreen;
  final Function(String) previousScreen;

  SignUpPage({required this.nextScreen, required this.previousScreen}) : super(key: ValueKey(SIGN_UP));  

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return BlocProvider(
          lazy: false,
          create: (context) => getIt<SignUpBloc>(),
          child: SignUpScreen(nextScreen: nextScreen, previousScreen: previousScreen),
        );
      },
    );
  }
}


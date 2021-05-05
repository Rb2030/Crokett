import 'package:crokett/features/login_and_sign_up/blocs/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:crokett/features/login_and_sign_up/page_widgets/mobile/forgot_password_screen.dart';
import 'package:crokett/injection.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends Page {
  final Function(String) nextScreen;
  final Function(String) previousScreen;

  ForgotPasswordPage({required this.nextScreen, required this.previousScreen})
      : super(key: ValueKey(GOOGLE_SIGN_IN));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return BlocProvider(
          lazy: false,
          create: (context) => getIt<ForgotPasswordBloc>(),
          child: ForgotPasswordScreen(nextScreen: nextScreen, previousScreen: previousScreen),
        );
      },
    );
  }
}

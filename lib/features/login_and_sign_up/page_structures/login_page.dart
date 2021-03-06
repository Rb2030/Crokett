import 'package:crokett/core/global/widgets/fade_animation_page.dart';
import 'package:crokett/features/login_and_sign_up/blocs/login_bloc/login_bloc.dart';
import 'package:crokett/features/login_and_sign_up/page_widgets/mobile/login_screen.dart';
import 'package:crokett/injection.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends Page {
  final Function(String) nextScreen;

  LoginPage({required this.nextScreen}) : super(key: ValueKey(LOGIN));  

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        var curveTween = CurveTween(curve: Curves.easeIn);
        return FadeTransition(
          opacity: animation.drive(curveTween),
          child: BlocProvider(
          lazy: false,
          create: (context) => getIt<LoginBloc>(),            
          child: LoginScreen(nextScreen: nextScreen),
          ),
        );
      },
    );
  }
}
import 'package:crokett/features/splash_screen/page_widgets/splash_animation.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';

class SplashPage extends Page {
  final Function(String) nextScreen;

  SplashPage({required this.nextScreen}) : super(key: ValueKey(SPLASH)); 

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return SplashAnimation(nextScreen: nextScreen);
      },
    );
  }
}
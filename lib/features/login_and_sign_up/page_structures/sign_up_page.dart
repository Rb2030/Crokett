import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';

class SignUpPage extends Page {
  final Function(String) nextScreen;

  SignUpPage({required this.nextScreen}) : super(key: ValueKey(SIGN_UP));  

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return Container( // This will be signupcreen instead of container passing next screen func with provider
          height: 20,
          width: 20,
          color: Colors.green,
        );
      },
    );
  }
}


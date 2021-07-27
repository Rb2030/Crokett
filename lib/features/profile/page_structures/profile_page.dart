import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';

class ProfilePage extends Page {
  final Function(String) nextScreen;

  ProfilePage({required this.nextScreen}) : super(key: ValueKey(PROFILE));  

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return Container( // This will be profilescreen
          height: 20,
          width: 20,
          color: Colors.green,
        );
      },
    );
  }
}
import 'package:crokett/injection.dart';
import 'package:crokett/routes/app_shell.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends Page {
  final Function(String) nextScreen;

  SettingsPage({required this.nextScreen}) : super(key: ValueKey(SETTINGS));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return Container( // This will be settingsscreen
          height: 20,
          width: 20,
          color: Colors.pink,
          child: Center(child: Text('SETTINGS', style: TextStyle(color: Colors.white),))
        );
      }, //AppShell(nextScreen);
    );
  }
}

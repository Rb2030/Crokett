import 'package:crokett/injection.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HelpPage extends Page {
  final Function(String) nextScreen;

  HelpPage({required this.nextScreen}) : super(key: ValueKey(HELP));  

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return Container( // This will be helpscreen
          height: 20,
          width: 20,
          color: Colors.yellow,
          child: Center(child: Text('HELP', style: TextStyle(color: Colors.white),))
        );
      }, //AppShell(nextScreen);
    );
  }
}
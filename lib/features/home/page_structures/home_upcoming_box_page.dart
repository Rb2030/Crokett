import 'package:crokett/injection.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeUpcomingBoxPage extends Page {
  final Function(String) nextScreen;

  HomeUpcomingBoxPage({required this.nextScreen}) : super(key: ValueKey(HOME_UPCOMING_BOX));  

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return Container( // This will be homescreen instead of container passing next screen func with provider
          height: 20,
          width: 20,
          color: Colors.green,
        );
      },
    );
  }
}
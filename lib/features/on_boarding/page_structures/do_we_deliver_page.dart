import 'package:crokett/injection.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoWeDeliverPage extends Page {
  final Function(String) nextScreen;

  DoWeDeliverPage({required this.nextScreen}) : super(key: ValueKey(DO_WE_DELIVER));  

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return Container( // This will be doWeDeliverscreen instead of container passing next screen func with provider
          height: 20,
          width: 20,
          color: Colors.green,
        );
      },
    );
  }
}

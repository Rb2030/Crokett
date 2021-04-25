import 'package:crokett/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends Page {
  final String pageValueKey;

  LoginPage(this.pageValueKey) : super(key: ValueKey(pageValueKey));  

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return Container(
          height: 20,
          width: 20,
          color: Colors.green,
        );
      },
    );
  }
}

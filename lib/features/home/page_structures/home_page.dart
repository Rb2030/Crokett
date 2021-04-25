import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';

class HomePage extends Page {
  final String pageValueKey;

  HomePage(this.pageValueKey) : super(key: ValueKey(pageValueKey));

  @override
  Route createRoute(BuildContext context) {
    // TODO: homeScreen child
    throw UnimplementedError();
  }
}

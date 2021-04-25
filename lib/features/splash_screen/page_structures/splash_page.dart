import 'package:crokett/features/splash_screen/page_widgets/splash_animation.dart';
import 'package:crokett/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends Page {
  final String pageValueKey;

  SplashPage(this.pageValueKey) : super(key: ValueKey(pageValueKey)); 

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return SplashAnimation();
      },
    );
  }
}
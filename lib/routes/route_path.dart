import 'package:flutter/material.dart';

abstract class RoutePath {}

class SplashPath extends RoutePath {} // '/splash'

class OnBoardingPath extends RoutePath {} // '/on_boarding'

class LoginPath extends RoutePath {} // '/login'

class SignUpPath extends RoutePath {} // '/sign_up'

class MainMenuPath extends RoutePath { // '/main_menu'
  
  final int id; // Parameter to be added to route

  MainMenuPath({required this.id});
}

class SettingsPath extends RoutePath {} // '/settings'

// Main Menu Items

const String Profile = 'Profile';
const String Boxes = 'Boxes';
const String Recipes = 'Recipes';
const String Cookshop = 'Cook Shop';
const String TipsAndTricks = 'Tips & Tricks';
const String Help = 'Help';


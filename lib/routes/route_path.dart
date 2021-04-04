import 'package:flutter/material.dart';

abstract class RoutePath {}

class SplashPath extends RoutePath {} // '/splash'

class OnBoardingPath extends RoutePath {} // '/on_boarding'

class LoginPath extends RoutePath {} // '/login'

class SignUpPath extends RoutePath {} // '/sign_up'

class MainMenuPath extends RoutePath {
  // '/main_menu'

  final int id; // Parameter to be added to route

  MainMenuPath({required this.id});
}

// Main Menu Items

const String Profile = 'profile';
const String Boxes = 'boxes';
const String Recipes = 'recipes';
const String Cookshop = 'cookshop';
const String TipsAndTricks = 'tips&tricks';
const String Help = 'help';
const String Settings = 'settings';

List<String> mainMenuArray = [Boxes, Cookshop, Help, Profile, Recipes, Settings, TipsAndTricks];

import 'package:flutter/material.dart';

abstract class RoutePath {}

class SplashPath extends RoutePath {} // '/splash'

class OnBoardingPath extends RoutePath {} // '/on_boarding'

class LoginPath extends RoutePath {} // '/login'

class GoogleLoginPath extends RoutePath {} // '/google_login'

class SignUpPath extends RoutePath {} // '/sign_up'

class MainMenuPath extends RoutePath {
  // '/main_menu'

  final int id; // Parameter to be added to route

  MainMenuPath({required this.id});
}

// Routes

const String Splash = 'splash';
const String Onboarding = 'on_boarding';
const String Login = 'login';
const String GoogleLogin = 'google_login';
const String SignUp = 'sign_up';

// Main Menu Items

const String Home = '/';
const String Profile = 'profile';
const String Boxes = 'boxes';
const String Recipes = 'recipes';
const String Cookshop = 'cookshop';
const String TipsAndTricks = 'tips&tricks';
const String Help = 'help';
const String Settings = 'settings';

List<String> mainMenuArray = [Home, Profile, Boxes, Recipes, Cookshop, TipsAndTricks, Help, Settings];

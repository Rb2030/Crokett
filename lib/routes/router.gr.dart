// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/login/presentation/page_structures/login_page.dart';
import '../features/on_boarding/page_structures/onboarding_page.dart';
import '../features/sign_up/page_structures/sign_up_page.dart';
import '../features/splash_screen/presentation/page_structures/splash_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String onBoardingPage = '/on-boarding-page';
  static const String loginPage = '/login-page';
  static const String signUpPage = '/sign-up-page';
  static const all = <String>{
    splashPage,
    onBoardingPage,
    loginPage,
    signUpPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.onBoardingPage, page: OnBoardingPage),
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.signUpPage, page: SignUpPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashPage(),
        settings: data,
      );
    },
    OnBoardingPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnBoardingPage(),
        settings: data,
      );
    },
    LoginPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginPage(),
        settings: data,
      );
    },
    SignUpPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpPage(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashPage() => push<dynamic>(Routes.splashPage);

  Future<dynamic> pushOnBoardingPage() => push<dynamic>(Routes.onBoardingPage);

  Future<dynamic> pushLoginPage() => push<dynamic>(Routes.loginPage);

  Future<dynamic> pushSignUpPage() => push<dynamic>(Routes.signUpPage);
}

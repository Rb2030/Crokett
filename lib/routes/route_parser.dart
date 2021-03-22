import 'package:flutter/material.dart';
import 'ui_pages.dart';

class RouteParser extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    if (uri.pathSegments.isEmpty) {
      return SplashPageConfig;
    }

    final path = uri.pathSegments[0];
    switch (path) {
      case SplashPath:
        return SplashPageConfig;
      case OnBoardingPath:
        return OnBoardingPageConfig;
      case LoginPath:
        return LoginPageConfig;
      case SignUpPath:
        return SignUpPageConfig;
      case MainMenuPath:
        return MainMenuPageConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case Pages.Splash:
        return const RouteInformation(location: SplashPath);
      case Pages.OnBoarding:
        return const RouteInformation(location: OnBoardingPath);
      case Pages.Login:
        return const RouteInformation(location: LoginPath);
      case Pages.SignUp:
        return const RouteInformation(location: SignUpPath);
      case Pages.MainMenu:
        return const RouteInformation(location: MainMenuPath);
      default: return const RouteInformation(location: SplashPath);

    }
  }
}
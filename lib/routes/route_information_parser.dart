import 'package:crokett/routes/route_path.dart';
import 'package:flutter/material.dart';

class CrokettRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.length >= 2) {
      for (String p in mainMenuArray) {
        if (uri.pathSegments[0] == p) {
          return MainMenuPath(id: int.tryParse(uri.pathSegments[1])!);
        }
      }
    }
    return MainMenuPath(id: 0); // 1 brings us to the Main Menu section by default
  }

  @override
  RouteInformation? restoreRouteInformation(RoutePath configuration) {
    if (configuration is MainMenuPath) {
      return RouteInformation(location: '/main_menu/${configuration.id}');
    }
    return null;
  }
}

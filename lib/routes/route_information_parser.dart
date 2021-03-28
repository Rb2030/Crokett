import 'package:crokett/routes/route_path.dart';
import 'package:flutter/material.dart';

class CrokettRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'settings') {
      return SettingsPath();
    } else {
      if (uri.pathSegments.length >= 2) {
        if (uri.pathSegments[0] == 'main_menu') {
          return MainMenuPath(id: int.tryParse(uri.pathSegments[1])!);
        }
      }
      throw Error(); // Not sure about this?
    }
  }

  @override
  RouteInformation? restoreRouteInformation(RoutePath configuration) {
    if (configuration is MainMenuPath) {
      return RouteInformation(location: '/main_menu/${configuration.id}');
    }
    if (configuration is SettingsPath) {
      return RouteInformation(location: '/settings');
    }
    return null;
  }
}

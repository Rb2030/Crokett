import 'package:crokett/routes/app_shell.dart';
import 'package:crokett/routes/app_state.dart';
import 'package:crokett/routes/route_path.dart';
import 'package:flutter/material.dart';

class CrokettRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  AppState appState = AppState();
  bool mainMenuSelected = false;
  bool showBackButton = false;
  String title = '';

  CrokettRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    appState.addListener(notifyListeners);
  }

  RoutePath get currentConfiguration {
    return MainMenuPath(id: appState.getSelectedMenuItemById());
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: AppShell(
              appState: appState,
              mainMenuSelected: mainMenuSelected,
              showBackButton: showBackButton,
              title: title),
        ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        if (appState.selectedMenuItem.title != '') {
          appState.selectedMenuItem = MenuItem('');
        }
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RoutePath path) async {
    if (path is MainMenuPath) {
      appState.setSelectedMenuItemById(path.id);
    } else {
      appState.selectedMenuItem = MenuItem('');
    }
  }
}

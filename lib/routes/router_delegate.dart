import 'package:crokett/features/splash_screen/presentation/page_structures/splash_page.dart';
import 'package:crokett/routes/app_shell.dart';
import 'package:crokett/routes/app_state.dart';
import 'package:crokett/routes/route_path.dart';
import 'package:flutter/material.dart';

class CrokettRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  AppState appState = AppState();

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
        // Auth Bloc + Splash Page etc
        // Need to have the if else here for if signed in, if not go to login/signup
        // MaterialPage(
        //   child: SplashPage(),
        // ),
        MaterialPage(
          child: AppShell(appState: appState),
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

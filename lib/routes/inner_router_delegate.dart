import 'package:crokett/features/main_menu/page_structures/boxes_page.dart';
import 'package:crokett/features/main_menu/page_structures/cookshop_page.dart';
import 'package:crokett/features/main_menu/page_structures/help_page.dart';
import 'package:crokett/features/main_menu/page_structures/profile_page.dart';
import 'package:crokett/features/main_menu/page_structures/recipes_page.dart';
import 'package:crokett/features/main_menu/page_structures/tips_and_tricks_page.dart';
import 'package:crokett/routes/app_state.dart';
import 'package:crokett/routes/route_path.dart';
import 'package:flutter/material.dart';

class InnerRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  AppState get appState => _appState;
  AppState _appState;

  set appState(AppState value) {
    if (value == _appState) {
      return;
    }
    _appState = value;
    notifyListeners();
  }

  InnerRouterDelegate(this._appState);

  @override
  Widget build(BuildContext context) {

   Widget getPage(MenuItem menuItem) {
      switch (menuItem.title) {
        case Boxes:
          return BoxesPage();
        case Cookshop:
          return CookShopPage();
        case Help:
          return HelpPage();
        case Profile:
          return ProfilePage();
        case Recipes:
          return RecipesPage();
        case TipsAndTricks:
          return TipsAndTricksPage();
        default:
          return RecipesPage();
      }
    }

    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
            key: ValueKey(appState.selectedMenuItem.title), child: getPage(appState.selectedMenuItem))

        // if (appState.selectedIndex == 0) ...[ // This is for after pressing burger menu/drawer button
        //   FadeAnimationPage(
        //     child: BooksListScreen(
        //       books: appState.menuItems,
        //       onTapped: _handleBookTapped,
        //     ),
        //     key: ValueKey('BooksListPage'),
        //   ),
        //   if (appState.selectedMenuItem.title != '')
        //     MaterialPage(
        //       key: ValueKey(appState.selectedMenuItem),
        //       child: BookDetailsScreen(book: appState.selectedMenuItem),
        //     ),
        // ] else
        //   FadeAnimationPage(
        //     child: SettingsPage(),
        //     key: ValueKey('SettingsPage'),
        //   ),
      ],
      onPopPage: (route, result) {
        appState.selectedMenuItem.title = '';
        notifyListeners();
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RoutePath path) async {
    // We may need this to drill down into each main menu section. E.g drill down into the
    assert(false);
  }

  void _handleMenuOptionTapped(MenuItem menuItem) {
    appState.selectedMenuItem = menuItem;
    notifyListeners();
  }
}

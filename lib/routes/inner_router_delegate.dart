import 'package:crokett/core/global/widgets/fade_animation_page.dart';
import 'package:crokett/features/boxes/page_structures/boxes_page.dart';
import 'package:crokett/features/cookshop/page_structures/cookshop_page.dart';
import 'package:crokett/features/help/page_structures/help_page.dart';
import 'package:crokett/features/profile/page_structures/profile_page.dart';
import 'package:crokett/features/recipes/page_structures/recipes_page.dart';
import 'package:crokett/features/settings/page_structures/settings_page.dart';
import 'package:crokett/features/tips_and_tricks/page_structures/tips_and_tricks_page.dart';
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
        case Profile:
          return ProfilePage();
        case Boxes:
          return BoxesPage();
        case Recipes:
          return RecipesPage();
        case Cookshop:
          return CookShopPage();
        case TipsAndTricks:
          return TipsAndTricksPage();
        case Help:
          return HelpPage();
        case Settings:
          return SettingsPage();
        default:
          return BoxesPage();
      }
    }

    return Navigator(
      key: navigatorKey,
      pages: [
        FadeAnimationPage(
            key: ValueKey(appState.selectedMenuItem.title), 
            child: getPage(appState.selectedMenuItem),
        ),

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

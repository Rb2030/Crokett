import 'package:crokett/features/login/presentation/page_structures/login_page.dart';
import 'package:crokett/features/main_menu/page_structures/main_menu_page.dart';
import 'package:crokett/features/on_boarding/page_structures/onboarding_page.dart';
import 'package:crokett/features/sign_up/page_structures/sign_up_page.dart';
import 'package:crokett/features/splash_screen/presentation/page_structures/splash_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'ui_pages.dart';

class CrokettRouterDelegate extends RouterDelegate<PageConfiguration> with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
 
  final List<Page> _pages = [];

  @override
  PageConfiguration get currentConfiguration => _pages.last.arguments as PageConfiguration;

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

    bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    _pages.remove(route.settings);
    notifyListeners();

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: List.of(_pages),
    );
  }

  void _removePage(MaterialPage page) {
    if (page != null) {
      _pages.remove(page);
    }
    notifyListeners();
  }

  @override
  Future<bool> popRoute() {
    if (_pages.length > 1) {
      _removePage(_pages.last);
      return Future.value(true);
    }
    return Future.value(false);
  }

  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
        child: child,
        key: Key(pageConfig.key),
        name: pageConfig.path,
        arguments: pageConfig);
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );
  }

  void addPage(PageConfiguration pageConfig) {
  
  final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            pageConfig.uiPage;

  if (shouldAddPage) {
    switch (pageConfig.uiPage) {
      case Pages.Splash:
        _addPageData(SplashPage(), SplashPageConfig);
        break;
      case Pages.OnBoarding:
        _addPageData(OnBoardingPage(), OnBoardingPageConfig);
        break;
      case Pages.Login:
        _addPageData(LoginPage(), LoginPageConfig);
        break;

      case Pages.SignUp:
        _addPageData(SignUpPage(), SignUpPageConfig);
        break;
      case Pages.MainMenu:
        _addPageData(MainMenuPage(), MainMenuPageConfig);
        break;
      default:
        break;
    }

    notifyListeners();
  }
}

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    addPage(newRoute);
  }

  void setPath(List<MaterialPage> path) {
    _pages.clear();
    _pages.addAll(path);
    notifyListeners();
  }

  void replaceAll(PageConfiguration newRoute) {
    setNewRoutePath(newRoute);
  }

  void push(PageConfiguration newRoute) {
    addPage(newRoute);
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    _addPageData(child, newRoute);
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    _pages.clear();
    addPage(configuration);
    return SynchronousFuture(null);
  }

  MaterialPage _getPage(Pages routeName) {
    return _pages.lastWhere((element) =>
        (element.arguments as PageConfiguration).uiPage == routeName);
  }

  void parseRoute(Uri uri) { //This is to be used for URI links (perhaps web?)
    if (uri.pathSegments.isEmpty) {
      setNewRoutePath(SplashPageConfig);
      return;
    }

    // Handle navapp://deeplinks/details/#
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'cooking_utensils_details') {
     //   pushWidget(CookingUtensilsDetails(int.parse(uri.pathSegments[1])), CookingUtensilsDetailsPageConfig);
      }
    } else if (uri.pathSegments.length == 1) {
      final path = uri.pathSegments[0];
      switch (path) {
        case 'splash':
          replaceAll(SplashPageConfig);
          break;
        case 'login':
          replaceAll(LoginPageConfig);
          break;
        case 'sign_up':
          setPath([
            _createPage(LoginPage(), LoginPageConfig),
            _createPage(SignUpPage(), SignUpPageConfig)
          ]);
          break;
        // case 'cooking_utensils_list':
        //   replaceAll(CookingUtensilsPageConfig);
        //   break;
        // case 'cart':
        //   setPath([
        //     _createPage(CookingUtensilsItems(), CookingUtensilsPageConfig),
        //     _createPage(Cart(), CartPageConfig)
        //   ]);
        //   break;
        // case 'checkout':
        //   setPath([
        //     _createPage(ListItems(), ListItemsPageConfig),
        //     _createPage(Checkout(), CheckoutPageConfig)
        //   ]);
        //   break;
        // case 'settings':
        //   setPath([
        //     _createPage(ListItems(), ListItemsPageConfig),
        //     _createPage(Settings(), SettingsPageConfig)
        //   ]);
        //   break;
      }
    }
  }

  void remove(Pages routeName) {
    _removePage(_getPage(routeName));
  }

}
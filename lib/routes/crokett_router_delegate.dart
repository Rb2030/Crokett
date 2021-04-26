import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/widgets/unknown_page.dart';
import 'package:crokett/features/login_and_sign_up/page_structures/google_sign_in_page.dart';
import 'package:crokett/features/login_and_sign_up/page_structures/login_page.dart';
import 'package:crokett/features/login_and_sign_up/page_structures/sign_up_page.dart';
import 'package:crokett/features/splash_screen/page_structures/splash_page.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';

class CrokettRouterDelegate extends RouterDelegate<CrokettConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<CrokettConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey;

  bool _show404 = false;
  bool get show404 => _show404;
  set show404(bool value) {
    _show404 = value;
    if (value == true) {
      selectedItemCode = '';
    }
    notifyListeners();
  }

  bool _splashFinished = false;
  bool get splashFinished => _splashFinished;
  set splashFinished(value) {
    _splashFinished = value;
    notifyListeners();
  }

  List<String> _currentPages =
      []; // This will be passed through from the Page class when navigating to a new screen
  String get currentPage => _currentPages.last;
  set currentPage(String value) {
    _currentPages.add(value);
    notifyListeners();
  }

  String _selectedItemCode = '';
  String get selectedItemCode => _selectedItemCode;
  set selectedItemCode(String value) {
    _selectedItemCode = value;
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  CrokettRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  @override
  CrokettConfiguration get currentConfiguration {
    if (currentPage == UNKNOWN) {
      return CrokettConfiguration.unknown();
    } else if (currentPage == SPLASH) {
      return CrokettConfiguration.splash();
    } else if (currentPage == LOGIN) {
      return CrokettConfiguration.login();
    } else if (currentPage == SIGN_UP) {
      return CrokettConfiguration.signUp();
    } else if (currentPage == GOOGLE_SIGN_IN) {
      return CrokettConfiguration.googleSignIn();
    } else if (currentPage == DO_WE_DELIVER) {
      return CrokettConfiguration.doWeDeliver();
    } else if (currentPage == FOOD_PREFERENCES) {
      return CrokettConfiguration.foodPreferences();
    } else if (currentPage == PROFILE) {
      return CrokettConfiguration.profile();
    } else if (currentPage == HOME) {
      return CrokettConfiguration.home();
    } else if (currentPage == FEATURED) {
      return CrokettConfiguration.homeFeatured(_selectedItemCode);
    } else if (currentPage == UPCOMING_BOX) {
      return CrokettConfiguration.homeUpcomingBox(_selectedItemCode);
    } else if (currentPage == SELECTED_FOR_YOU) {
      return CrokettConfiguration.homeSelectedForYou(_selectedItemCode);
    } else if (currentPage == BOXES) {
      return CrokettConfiguration.boxes();
    } else if (currentPage == SELECTED_BOX) {
      return CrokettConfiguration.selectedBox(_selectedItemCode);
    } else if (currentPage == RECIPES) {
      return CrokettConfiguration.recipes();
    } else if (currentPage == SELECTED_RECIPE) {
      return CrokettConfiguration.selectedRecipe(_selectedItemCode);
    } else if (currentPage == COOKSHOP) {
      return CrokettConfiguration.cookshop();
    } else if (currentPage == SELECTED_COOKSHOP_ITEM) {
      return CrokettConfiguration.selectedCookshopItem(_selectedItemCode);
    } else if (currentPage == TIPS_AND_TRICKS) {
      return CrokettConfiguration.tipsAndTricks();
    } else if (currentPage == SELECTED_TIPS_AND_TRICKS) {
      return CrokettConfiguration.selectedTipsAndTricks(_selectedItemCode);
    } else if (currentPage == HELP) {
      return CrokettConfiguration.help();
    } else if (currentPage == SETTINGS) {
      return CrokettConfiguration.settings();
    } else {
      return CrokettConfiguration.unknown();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Page> stack;
    if (show404 == true) {
      stack = _unknownStack;
    } else if (splashFinished == false) {
      stack = _splashStack;
    } else if (splashFinished == true && currentPage == LOGIN) {
      stack = _loginStack;
    } else if (splashFinished == true && currentPage == SIGN_UP) {
      stack = _signUpStack;
    } else if (splashFinished == true && currentPage == GOOGLE_SIGN_IN) {
      stack = _googleSignInStack;
    } else if (splashFinished == true && currentPage == DO_WE_DELIVER) {
      stack = _doWeDeliverStack;
    } else if (splashFinished == true && currentPage == FOOD_PREFERENCES) {
      stack = _foodPreferencesStack;
    } else if (splashFinished == true && currentPage == PROFILE) {
      stack = _profileStack;
    } else if (splashFinished == true && currentPage == HOME) {
      stack = _homeStack;
    } else if (splashFinished == true && currentPage == FEATURED) {
      stack = _featuredStack;
    } else if (splashFinished == true && currentPage == UPCOMING_BOX) {
      stack = _upcomingBoxStack;
    } else if (splashFinished == true && currentPage == SELECTED_FOR_YOU) {
      stack = _selectedForYouStack;
    } else if (splashFinished == true && currentPage == BOXES) {
      stack = _boxesStack;
    } else if (splashFinished == true && currentPage == SELECTED_BOX) {
      stack = _selectedBoxStack;
    } else if (splashFinished == true && currentPage == RECIPES) {
      stack = _recipesStack;
    } else if (splashFinished == true && currentPage == SELECTED_RECIPE) {
      stack = _selectedRecipeStack;
    } else if (splashFinished == true && currentPage == COOKSHOP) {
      stack = _cookshopStack;
    } else if (splashFinished == true &&
        currentPage == SELECTED_COOKSHOP_ITEM) {
      stack = _selectedCookshopStack;
    } else if (splashFinished == true && currentPage == TIPS_AND_TRICKS) {
      stack = _tipsAndTricksStack;
    } else if (splashFinished == true &&
        currentPage == SELECTED_TIPS_AND_TRICKS) {
      stack = _selectedTipsAndTricksStack;
    } else if (splashFinished == true && currentPage == HELP) {
      stack = _helpStack;
    } else if (splashFinished == true && currentPage == SETTINGS) {
      stack = _settingsStack;
    } else {
      stack = _unknownStack; // This may not need to be here
    }
    return Navigator(
      key: navigatorKey,
      pages: stack,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        selectedItemCode = '';
        _currentPages.removeLast();
        return true;
      },
    );
  }

  // Unknown
  List<Page> get _unknownStack => [UnknownPage()];

  // Splash
  List<Page> get _splashStack => [
    SplashPage(nextScreen: (String selectedPage) {
      currentPage = selectedPage;
    })
  ];

  // Login
  List<Page> get _loginStack => [
    LoginPage(nextScreen: (String selectedPage) {
      currentPage = selectedPage;
    })
  ];

  // SignUp
  List<Page> get _signUpStack => [
    LoginPage(nextScreen: (String selectedPage) {
      currentPage = selectedPage;
    }),

    SignUpPage(nextScreen: (String selectedPage) {
      currentPage = selectedPage;
    })
  ];
  
  // SignUp
  List<Page> get _googleSignInStack => [
    LoginPage(nextScreen: (String selectedPage) {
      currentPage = selectedPage;
    }),

    GoogleSignInPage(nextScreen: (String selectedPage) {
      currentPage = selectedPage;
    })
  ];

  // Do We Deliver
  List<Page> get _doWeDeliverStack => [
    DoWeDeliverPage(nextScreen: (String selectedPage) {
      currentPage = selectedPage;
    })
  ];

  // Food Preferences
  List<Page> get _foodPreferencesStack => [
    DoWeDeliverPage(nextScreen: (String selectedPage) {
      currentPage = selectedPage;
    }),

    FoodPreferencesPage(nextScreen: (String selectedPage) {
      currentPage = selectedPage;
    })
  ];


  @override
  Future<void> setNewRoutePath(CrokettConfiguration configuration) async {
    if (configuration.unknown) {
      currentPage = UNKNOWN;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isSplashPage) {
      currentPage = SPLASH;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isLoginPage) {
      currentPage = LOGIN;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isSignUpPage) {
      currentPage = SIGN_UP;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isGoogleSignInPage) {
      currentPage = GOOGLE_SIGN_IN;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isDoWeDeliverPage) {
      currentPage = DO_WE_DELIVER;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isFoodPreferencesPage) {
      currentPage = FOOD_PREFERENCES;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isProfilePage) {
      currentPage = PROFILE;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isHomePage) {
      currentPage = HOME;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isHomeUpcomingBoxPage) {
      currentPage = UPCOMING_BOX;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isHomeSelectedForYouPage) {
      currentPage = SELECTED_FOR_YOU;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isBoxesPage) {
      currentPage = BOXES;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isSelectedBoxPage) {
      currentPage = SELECTED_BOX;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isRecipesPage) {
      currentPage = RECIPES;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isSelectedRecipePage) {
      currentPage = SELECTED_RECIPE;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isCookshopPage) {
      currentPage = COOKSHOP;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isSelectedCookshopPage) {
      currentPage = SELECTED_COOKSHOP_ITEM;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isTipsAndTricksPage) {
      currentPage = TIPS_AND_TRICKS;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isSelectedTipsAndTricksPage) {
      currentPage = SELECTED_TIPS_AND_TRICKS;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isHelpPage) {
      currentPage = HELP;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isSettingsPage) {
      currentPage = SETTINGS;
      selectedItemCode = configuration.selectedItemId;
    } else {
      print(Constants.failureCouldNotSetRoute);
    }
  }

  _clear() {
    currentPage = UNKNOWN;
    selectedItemCode = '';
  }
}

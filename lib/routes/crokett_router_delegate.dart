import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/widgets/unknown_page.dart';
import 'package:crokett/features/boxes/page_structures/selected_box_page.dart';
import 'package:crokett/features/cookshop/page_structures/cookshop_categories_page.dart';
import 'package:crokett/features/cookshop/page_structures/selected_cookshop_item_page.dart';
import 'package:crokett/features/help/page_structures/help_page.dart';
import 'package:crokett/features/help/page_structures/selected_help_item_page.dart';
import 'package:crokett/features/home/page_structures/home_featured_page.dart';
import 'package:crokett/features/home/page_structures/home_selected_for_you_page.dart';
import 'package:crokett/features/home/page_structures/home_upcoming_box_page.dart';
import 'package:crokett/features/login_and_sign_up/page_structures/forgot_password_page.dart';
import 'package:crokett/features/login_and_sign_up/page_structures/login_page.dart';
import 'package:crokett/features/login_and_sign_up/page_structures/sign_up_page.dart';
import 'package:crokett/features/on_boarding/page_structures/onboarding_page.dart';
import 'package:crokett/features/profile/page_structures/profile_page.dart';
import 'package:crokett/features/recipes/page_structures/recipe_type_page.dart';
import 'package:crokett/features/recipes/page_structures/selected_recipe_page.dart';
import 'package:crokett/features/settings/page_structures/settings_page.dart';
import 'package:crokett/features/splash_screen/page_structures/splash_page.dart';
import 'package:crokett/features/tips_and_tricks/page_structures/selected_tips_and_tricks_page.dart';
import 'package:crokett/routes/app_shell.dart';
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

  String _currentPage =
      'splash'; // This will be passed through from the Page class when navigating to a new screen
  String get currentPage => _currentPage;
  set currentPage(String value) {
    _currentPage = value;
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
    if (currentPage == UNKNOWN || currentPage == '') {
      return CrokettConfiguration.unknown();
    } else if (currentPage == SPLASH) {
      return CrokettConfiguration.splash();
    } else if (currentPage == LOGIN) {
      return CrokettConfiguration.login();
    } else if (currentPage == FORGOT_PASSWORD) {
      return CrokettConfiguration.forgotPassword();
    } else if (currentPage == SIGN_UP) {
      return CrokettConfiguration.signUp();
    } else if (currentPage == ONBOARDING) {
      return CrokettConfiguration.onBoarding();
    } else if (currentPage == DO_WE_DELIVER) {
      return CrokettConfiguration.doWeDeliver();
    } else if (currentPage == FOOD_PREFERENCES) {
      return CrokettConfiguration.foodPreferences();
    } else if (currentPage == PROFILE) {
      return CrokettConfiguration.profile();
    } else if (currentPage == APPSHELL) {
      return CrokettConfiguration.appShell();
    } else if (currentPage == HOME_FEATURED) {
      return CrokettConfiguration.homeFeatured(_selectedItemCode);
    } else if (currentPage == HOME_UPCOMING_BOX) {
      return CrokettConfiguration.homeUpcomingBox(_selectedItemCode);
    } else if (currentPage == HOME_SELECTED_FOR_YOU) {
      return CrokettConfiguration.homeSelectedForYou(_selectedItemCode);
      // } else if (currentPage == BOXES) {
      //   return CrokettConfiguration.boxes();
    } else if (currentPage == SELECTED_BOX) {
      return CrokettConfiguration.selectedBox(_selectedItemCode);
      // } else if (currentPage == RECIPES) {
      //   return CrokettConfiguration.recipes();
    } else if (currentPage == RECIPE_TYPE) {
      return CrokettConfiguration.recipeType(_selectedItemCode);
    } else if (currentPage == SELECTED_RECIPE) {
      return CrokettConfiguration.selectedRecipe(_selectedItemCode);
      // } else if (currentPage == COOKSHOP) {
      //   return CrokettConfiguration.cookshop();
    } else if (currentPage == COOKSHOP_CATEGORIES) {
      return CrokettConfiguration.cookshopCategories();
    } else if (currentPage == SELECTED_COOKSHOP_ITEM) {
      return CrokettConfiguration.selectedCookshopItem(_selectedItemCode);
      // } else if (currentPage == TIPS_AND_TRICKS) {
      //   return CrokettConfiguration.tipsAndTricks();
    } else if (currentPage == SELECTED_TIPS_AND_TRICKS) {
      return CrokettConfiguration.selectedTipsAndTricks(_selectedItemCode);
      // } else if (currentPage == HELP) {
      //   return CrokettConfiguration.help();
    } else if (currentPage == SELECTED_HELP_ITEM) {
      return CrokettConfiguration.selectedHelpItem(_selectedItemCode);
      // } else if (currentPage == SETTINGS) {
      //   return CrokettConfiguration.settings();
    } else {
      return CrokettConfiguration.unknown();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Page>? stack;
    if (show404 == true) {
      stack = _unknownStack;
    } else if (currentPage == SPLASH) {
      stack = _splashStack;
    } else if (currentPage == LOGIN) {
      stack = _loginStack;
    } else if (currentPage == FORGOT_PASSWORD) {
      stack = _forgotPasswordStack;
    } else if (currentPage == SIGN_UP) {
      stack = _signUpStack;
    } else if (currentPage == ONBOARDING) {
      stack = _onBoardingStack;
      // } else if (currentPage == DO_WE_DELIVER) {
      //   stack = _doWeDeliverStack;
      // } else if (currentPage == FOOD_PREFERENCES) {
      //   stack = _foodPreferencesStack;
    } else if (currentPage == PROFILE) {
      stack = _profileStack;
    } else if (currentPage == APPSHELL) {
      // This is home but encompasses all home routes as app shell wraps all of them
      stack = _appShellDrawerStack;
    } else if (currentPage == HOME_FEATURED) {
      stack = _homeFeaturedStack;
    } else if (currentPage == HOME_UPCOMING_BOX) {
      stack = _homeUpcomingBoxStack;
    } else if (currentPage == HOME_SELECTED_FOR_YOU) {
      stack = _homeSelectedForYouStack;
      // } else if (currentPage == BOXES) {
      //   stack = _boxesStack;
    } else if (currentPage == SELECTED_BOX) {
      stack = _selectedBoxStack;
      // } else if (currentPage == RECIPES) {
      //   stack = _recipesStack;
    } else if (currentPage == RECIPE_TYPE) {
      stack = _recipeTypeStack;
    } else if (currentPage == SELECTED_RECIPE) {
      stack = _selectedRecipeStack;
      // } else if (currentPage == COOKSHOP) {
      //   stack = _cookshopStack;
    } else if (currentPage == COOKSHOP_CATEGORIES) {
      stack = _cookshopCategoriesStack;
    } else if (currentPage == SELECTED_COOKSHOP_ITEM) {
      stack = _selectedCookshopItemStack;
      // } else if (currentPage == TIPS_AND_TRICKS) {
      //   stack = _tipsAndTricksStack;
    } else if (currentPage == SELECTED_TIPS_AND_TRICKS) {
      stack = _selectedTipsAndTricksStack;
    } else if (currentPage == HELP) {
      stack = _helpStack;
    } else if (currentPage == SETTINGS) {
      stack = _settingsStack;
    }

    return Navigator(
      key: navigatorKey,
      pages: stack!,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        selectedItemCode = '';
        //      _currentPage = '';
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

  // Forgot Password
  List<Page> get _forgotPasswordStack => [
        LoginPage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }),
        if (currentPage == FORGOT_PASSWORD)
          ForgotPasswordPage(nextScreen: (String selectedPage) {
            currentPage = selectedPage;
          }, previousScreen: (String pageToReturnTo) {
            currentPage = pageToReturnTo;
          })
      ];

  // Sign Up
  List<Page> get _signUpStack => [
        LoginPage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }),
        if (currentPage == SIGN_UP)
          SignUpPage(nextScreen: (String selectedPage) {
            currentPage = selectedPage;
          }, previousScreen: (String pageToReturnTo) {
            currentPage = pageToReturnTo;
          })
      ];

  // On Boarding
  List<Page> get _onBoardingStack => [
        OnBoardingPage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        })
      ];

  // // Do We Deliver
  // List<Page> get _doWeDeliverStack => [
  //   DoWeDeliverPage(nextScreen: (String selectedPage) {
  //     currentPage = selectedPage;
  //   })
  // ];

  // // Food Preferences
  // List<Page> get _foodPreferencesStack => [
  //   DoWeDeliverPage(nextScreen: (String selectedPage) {
  //     currentPage = selectedPage;
  //   }),
  //   FoodPreferencesPage(nextScreen: (String selectedPage) {
  //     currentPage = selectedPage;
  //   })
  // ];

  // Profile
  List<Page> get _profileStack => [
        AppShell(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }),
        ProfilePage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }) previousScreen: (String pageToReturnTo) {
            currentPage = pageToReturnTo;
          })
      ];

  // // Home
  // List<Page> get _homeStack => [
  //       HomePage(nextScreen: (String selectedPage) {
  //         currentPage = selectedPage;
  //       }),
  //     ];

  // AppShell
  List<Page> get _appShellDrawerStack => [
        AppShell(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }),
      ];

  // Home Featured
  List<Page> get _homeFeaturedStack => [
        AppShell(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }),
        HomeFeaturedPage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        })
      ];

  // Home Up Coming Box
  List<Page> get _homeUpcomingBoxStack => [
        AppShell(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }),
        HomeUpcomingBoxPage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        })
      ];

  // Home Selected For You
  List<Page> get _homeSelectedForYouStack => [
        AppShell(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }),
        HomeSelectedForYouPage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        })
      ];

  // Boxes
  // List<Page> get _boxesStack => [
  //       BoxesPage(nextScreen: (String selectedPage) {
  //         currentPage = selectedPage;
  //       }),
  //     ];

  // Selected Box
  List<Page> get _selectedBoxStack => [
        AppShell(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }),
        SelectedBoxPage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        })
      ];

  // Recipes
  // List<Page> get _recipesStack => [
  //       RecipesPage(nextScreen: (String selectedPage) {
  //         currentPage = selectedPage;
  //       }),
  //     ];

  // Recipe Type
  List<Page> get _recipeTypeStack => [
        AppShell(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }),
        RecipeTypePage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        })
      ];

  // Selected Recipe
  List<Page> get _selectedRecipeStack => [
        AppShell(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }),
        RecipeTypePage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }),
        SelectedRecipePage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        })
      ];

  // Cookshop
  // List<Page> get _cookshopStack => [
  //       CookshopPage(nextScreen: (String selectedPage) {
  //         currentPage = selectedPage;
  //       }),
  //     ];

  // Cookshop Categories
  List<Page> get _cookshopCategoriesStack => [
        AppShell(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }),
        CookshopCategoriesPage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        })
      ];

  // Selected Cookshop Item
  List<Page> get _selectedCookshopItemStack => [
        AppShell(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }),
        CookshopCategoriesPage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }),
        SelectedCookshopItemPage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        })
      ];

  // Tips & Tricks
  // List<Page> get _tipsAndTricksStack => [
  //       TipsAndTricksPage(nextScreen: (String selectedPage) {
  //         currentPage = selectedPage;
  //       }),
  //     ];

  // Selected Tips & Tricks
  List<Page> get _selectedTipsAndTricksStack => [
        AppShell(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }),
        SelectedTipsAndTricksPage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        })
      ];

  // Help
  List<Page> get _helpStack => [
        HelpPage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }), previousScreen: (String pageToReturnTo) {
            currentPage = pageToReturnTo;
          })
      ];

  // Settings
  List<Page> get _settingsStack => [
        SettingsPage(nextScreen: (String selectedPage) {
          currentPage = selectedPage;
        }), previousScreen: (String pageToReturnTo) {
            currentPage = pageToReturnTo;
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
    } else if (configuration.isOnboardingPage) {
      currentPage = ONBOARDING;
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
    } else if (configuration.isAppShellPage) {
      currentPage = APPSHELL;
      //  selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isHomeUpcomingBoxPage) {
      currentPage = HOME_UPCOMING_BOX;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isHomeSelectedForYouPage) {
      currentPage = HOME_SELECTED_FOR_YOU;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isSelectedBoxPage) {
      currentPage = SELECTED_BOX;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isSelectedRecipeType) {
      currentPage = RECIPE_TYPE;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isSelectedRecipePage) {
      currentPage = SELECTED_RECIPE;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isSelectedCookshopCategoriesPage) {
      currentPage = COOKSHOP_CATEGORIES;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isSelectedCookshopItemPage) {
      currentPage = SELECTED_COOKSHOP_ITEM;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isSelectedTipsAndTricksPage) {
      currentPage = SELECTED_TIPS_AND_TRICKS;
      selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isHelpPage) {
      currentPage = HELP;
      //   selectedItemCode = configuration.selectedItemId;
    } else if (configuration.isSettingsPage) {
      currentPage = SETTINGS;
      //  selectedItemCode = configuration.selectedItemId;
    } else {
      print(Constants.failureCouldNotSetRoute);
    }
  }

  _clear() {
    currentPage = UNKNOWN;
    selectedItemCode = '';
  }
}

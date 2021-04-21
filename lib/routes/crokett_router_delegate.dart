import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/widgets/unknown_page.dart';
import 'package:crokett/features/boxes/blocs/boxes_bloc/boxes_bloc.dart';
import 'package:crokett/features/cookshop/blocs/cookshop_bloc/cookshop_bloc.dart';
import 'package:crokett/features/help/blocs/help_bloc/help_bloc.dart';
import 'package:crokett/features/home/blocs/home_bloc/home_bloc.dart';
import 'package:crokett/features/home/page_structures/home_page.dart';
import 'package:crokett/features/login_and_sign_up/blocs/auth_bloc/auth_bloc.dart';
import 'package:crokett/features/login_and_sign_up/blocs/google_sign_in_bloc/google_sign_in_bloc.dart';
import 'package:crokett/features/login_and_sign_up/blocs/login_bloc/login_bloc.dart';
import 'package:crokett/features/login_and_sign_up/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:crokett/features/login_and_sign_up/page_structures/login_page.dart';
import 'package:crokett/features/profile/blocs/profile_bloc/profile_bloc.dart';
import 'package:crokett/features/recipes/blocs/recipes_bloc/recipes_bloc.dart';
import 'package:crokett/features/settings/blocs/settings_bloc/settings_bloc.dart';
import 'package:crokett/features/splash_screen/page_structures/splash_page.dart';
import 'package:crokett/features/tips_and_tricks/blocs/tips_and_tricks_bloc/tips_and_tricks_bloc.dart';
import 'package:crokett/routes/app_shell.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:crokett/routes/router_bloc/router_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CrokettRouterDelegate extends RouterDelegate<CrokettConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<CrokettConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey;
  String currentPage = '';
  String selectedItem = '';

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  CrokettRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>() {
    _clear();
  }

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
      return CrokettConfiguration.homeFeatured(selectedItem);
    } else if (currentPage == UPCOMING_BOX) {
      return CrokettConfiguration.homeUpcomingBox(selectedItem);
    } else if (currentPage == SELECTED_FOR_YOU) {
      return CrokettConfiguration.homeSelectedForYou(selectedItem);
    } else if (currentPage == BOXES) {
      return CrokettConfiguration.boxes();
    } else if (currentPage == SELECTED_BOX) {
      return CrokettConfiguration.selectedBox(selectedItem);
    } else if (currentPage == RECIPES) {
      return CrokettConfiguration.recipes();
    } else if (currentPage == SELECTED_RECIPE) {
      return CrokettConfiguration.selectedRecipe(selectedItem);
    } else if (currentPage == COOKSHOP) {
      return CrokettConfiguration.cookshop();
    } else if (currentPage == SELECTED_COOKSHOP_ITEM) {
      return CrokettConfiguration.selectedCookshopItem(selectedItem);
    } else if (currentPage == TIPS_AND_TRICKS) {
      return CrokettConfiguration.tipsAndTricks();
    } else if (currentPage == SELECTED_TIPS_AND_TRICKS) {
      return CrokettConfiguration.selectedTipsAndTricks(selectedItem);
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
    Page page = UnknownPage();
    return MultiBlocListener(
      listeners: [
        // AuthBloc
        BlocListener<AuthBloc, AuthState>(
          listener: (context, authenticationState) {
            Navigator(
              key: navigatorKey,
              pages: [
                page = MaterialPage(
                  key: ValueKey(SPLASH),
                  child: SplashPage(),
                ),
                if (authenticationState is Authenticated) page = HomePage(),
                if (authenticationState is Unauthenticated) page = LoginPage()
              ],
              onPopPage: (route, result) {
                if (!route.didPop(result)) return false;
                context.read<AuthBloc>().add(AuthEventLoggedOut());
                return true;
              },
            );
          },
        ),
        // Login
        BlocListener<RouterBloc, RouterState>(
          listener: (context, state) {
            page = context.watch<RouterBloc>().page!;
          },
        ),
      ],
      child: AppShell(page), // should be appshell
    );
  }

  @override
  Future<void> setNewRoutePath(CrokettConfiguration configuration) async {
    // This whole function may be redundant now using blocs
    if (configuration.unknown) {
      currentPage = UNKNOWN;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isSplashPage) {
      currentPage = SPLASH;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isLoginPage) {
      currentPage = LOGIN;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isSignUpPage) {
      currentPage = SIGN_UP;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isGoogleSignInPage) {
      currentPage = GOOGLE_SIGN_IN;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isDoWeDeliverPage) {
      currentPage = DO_WE_DELIVER;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isFoodPreferencesPage) {
      currentPage = FOOD_PREFERENCES;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isProfilePage) {
      currentPage = PROFILE;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isHomePage) {
      currentPage = HOME;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isHomeUpcomingBoxPage) {
      currentPage = UPCOMING_BOX;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isHomeSelectedForYouPage) {
      currentPage = SELECTED_FOR_YOU;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isBoxesPage) {
      currentPage = BOXES;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isSelectedBoxPage) {
      currentPage = SELECTED_BOX;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isRecipesPage) {
      currentPage = RECIPES;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isSelectedRecipePage) {
      currentPage = SELECTED_RECIPE;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isCookshopPage) {
      currentPage = COOKSHOP;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isSelectedCookshopPage) {
      currentPage = SELECTED_COOKSHOP_ITEM;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isTipsAndTricksPage) {
      currentPage = TIPS_AND_TRICKS;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isSelectedTipsAndTricksPage) {
      currentPage = SELECTED_TIPS_AND_TRICKS;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isHelpPage) {
      currentPage = HELP;
      selectedItem = configuration.selectedItemId;
    } else if (configuration.isSettingsPage) {
      currentPage = SETTINGS;
      selectedItem = configuration.selectedItemId;
    } else {
      print(Constants.failureCouldNotSetRoute);
    }
  }

  _clear() {
    currentPage = UNKNOWN;
    selectedItem = '';
  }
}

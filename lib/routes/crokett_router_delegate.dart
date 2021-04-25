import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/features/login_and_sign_up/blocs/auth_bloc/auth_bloc.dart';
import 'package:crokett/features/splash_screen/page_structures/splash_page.dart';
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

  CrokettRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  @override
  CrokettConfiguration get currentConfiguration {
    currentPage = currentConfiguration.screen;
    selectedItem = currentConfiguration.selectedItemId;
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
    List<Page> pages = [SplashPage(SPLASH)];
    return BlocBuilder<RouterBloc, RouterState>(
      builder: (context, state) {
        if (state is ChangedRoute) {
          pages.clear();
          pages = state.pages;
          debugPrint('FOR FUCK SAKE FAAAAAAAAAAAAAAAAAAACK ' + currentPage);
        }
        return Navigator(
          key: navigatorKey,
          pages: pages,
          onPopPage: (route, result) {
            //TODO: Needs conditional for how to pop back note: see example app
            if (!route.didPop(result)) return false;
            context.read<AuthBloc>().add(AuthEventLoggedOut());
            return true;
          },
        );
      },
    );
  }

  @override
  Future<void> setNewRoutePath(CrokettConfiguration configuration) async {
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

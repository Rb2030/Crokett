import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';

class CrokettRouteInformationParser
    extends RouteInformationParser<CrokettConfiguration> {

  @override
  Future<CrokettConfiguration> parseRouteInformation(RouteInformation? routeInformation) async {
    final uri = Uri.parse(routeInformation!.location!);
    if (uri.pathSegments.length == 0) {
      return CrokettConfiguration.login();
    } else if (uri.pathSegments.length == 1) {
      final first = uri.pathSegments[0].toLowerCase();
      if (first == SPLASH) {
        return CrokettConfiguration.login();
      } else if (first == LOGIN) {
        return CrokettConfiguration.login();
      } else if (first == SIGN_UP) {
        return CrokettConfiguration.signUp();
      } else if (first == GOOGLE_SIGN_IN) {
        return CrokettConfiguration.googleSignIn();
      } else if (first == DO_WE_DELIVER) {
        return CrokettConfiguration.home();
      } else if (first == FOOD_PREFERENCES) {
        return CrokettConfiguration.foodPreferences();
      } else if (first == PROFILE) {
        return CrokettConfiguration.profile();
      } else if (first == HOME) {
        return CrokettConfiguration.home();
      } else if (first == BOXES) {
        return CrokettConfiguration.boxes();
      } else if (first == RECIPES) {
        return CrokettConfiguration.recipes();
      } else if (first == COOKSHOP) {
        return CrokettConfiguration.cookshop();
      } else if (first == TIPS_AND_TRICKS) {
        return CrokettConfiguration.tipsAndTricks();
      } else if (first == HELP) {
        return CrokettConfiguration.help();
      } else if (first == SETTINGS) {
        return CrokettConfiguration.settings();
      } else {
        return CrokettConfiguration.unknown();
      }
    } else if (uri.pathSegments.length == 2) {
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();
      if (first == FEATURED) {
        return CrokettConfiguration.homeFeatured(second);
      } else if (first == UPCOMING_BOX) {
        return CrokettConfiguration.homeUpcomingBox(second);
      } else if (first == SELECTED_FOR_YOU) {
        return CrokettConfiguration.homeSelectedForYou(second);
      } else if (first == SELECTED_BOX) {
        return CrokettConfiguration.selectedBox(second);
      } else if (first == SELECTED_RECIPE) {
        return CrokettConfiguration.selectedRecipe(second);
      } else if (first == SELECTED_COOKSHOP_ITEM) {
        return CrokettConfiguration.selectedCookshopItem(second);
      } else if (first == SELECTED_TIPS_AND_TRICKS) {
        return CrokettConfiguration.selectedTipsAndTricks(second);
      } else {
        return CrokettConfiguration.unknown();
      }
    } else {
      return CrokettConfiguration.unknown();
    }
  }

  @override
  RouteInformation restoreRouteInformation(CrokettConfiguration configuration) {
    if (configuration.isUnknownPage) {
      return RouteInformation(location: '/unknown');
    } else if (configuration.isSplashPage) {
      return RouteInformation(location: '/splash');
    } else if (configuration.isLoginPage) {
      return RouteInformation(location: '/login');
    } else if (configuration.isSignUpPage) {
      return RouteInformation(location: '/sign_up');
    } else if (configuration.isGoogleSignInPage) {
      return RouteInformation(location: '/google_sign_in');
    } else if (configuration.isDoWeDeliverPage) {
      return RouteInformation(location: '/do_we_deliver');
    } else if (configuration.isFoodPreferencesPage) {
      return RouteInformation(location: '/food_preferences');
    } else if (configuration.isProfilePage) {
      return RouteInformation(location: '/profile');
    } else if (configuration.isHomePage) {
      return RouteInformation(location: '/home');
    } else if (configuration.isHomeFeaturedPage) {
      return RouteInformation(location: '/home/${configuration.selectedItemId}');
    } else if (configuration.isHomeUpcomingBoxPage) {
      return RouteInformation(location: '/home/${configuration.selectedItemId}');
    } else if (configuration.isHomeSelectedForYouPage) {
      return RouteInformation(location: '/home/${configuration.selectedItemId}');
    } else if (configuration.isBoxesPage) {
      return RouteInformation(location: '/boxes');
    } else if (configuration.isSelectedBoxPage) {
      return RouteInformation(location: '/boxes/${configuration.selectedItemId}');
    } else if (configuration.isRecipesPage) {
      return RouteInformation(location: '/recipes');
    } else if (configuration.isSelectedRecipePage) {
      return RouteInformation(location: '/recipes/${configuration.selectedItemId}');
    } else if (configuration.isCookshopPage) {
      return RouteInformation(location: '/cookshop');
    } else if (configuration.isSelectedCookshopPage) {
      return RouteInformation(location: '/cookshop/${configuration.selectedItemId}');
    } else if (configuration.isTipsAndTricksPage) {
      return RouteInformation(location: '/tips_and_tricks');
    } else if (configuration.isSelectedTipsAndTricksPage) {
      return RouteInformation(location: '/tips_and_tricks/${configuration.selectedItemId}');
    } else if (configuration.isHelpPage) {
      return RouteInformation(location: '/help');
    } else if (configuration.isSettingsPage) {
      return RouteInformation(location: '/settings');
    } else {
      return RouteInformation(location: '/unknown');
    }
  }
}

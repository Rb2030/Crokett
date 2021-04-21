// URL params + configuration reference

const String UNKNOWN = "unknown";
const String SPLASH = "splash";
const String LOGIN = "login";
const String SIGN_UP = "sign_up";
const String GOOGLE_SIGN_IN = "google_sign_in";
const String DO_WE_DELIVER = "do_we_deliver";
const String FOOD_PREFERENCES = "food_preferences";
const String PROFILE = "profile";
const String HOME = "home";
const String FEATURED = "featured"; // Option in the home screen
const String UPCOMING_BOX = "upcoming_box"; // Option in the home screen
const String SELECTED_FOR_YOU = "selected_for_you"; // Option in the home screen
const String BOXES = "boxes";
const String SELECTED_BOX = "selected_box";
const String RECIPES = "recipes";
const String SELECTED_RECIPE = "selected_recipe";
const String COOKSHOP = "cookshop";
const String SELECTED_COOKSHOP_ITEM = "selected_cookshop_item";
const String TIPS_AND_TRICKS = "tips_and_tricks";
const String SELECTED_TIPS_AND_TRICKS = "selected_tips_and_tricks";
const String HELP = "help";
const String SETTINGS = "settings";

// Config

class CrokettConfiguration {
  final bool unknown;
  final bool splashPageFinished;
  final bool loggedIn;
  final String screen;
  final String selectedItemId;

  CrokettConfiguration.unknown()
      : unknown = true,
        splashPageFinished = false,
        loggedIn = true,
        screen = UNKNOWN,
        selectedItemId = '';

  CrokettConfiguration.splash()
      : unknown = false,
        splashPageFinished = false,
        loggedIn = false,
        screen = SPLASH,
        selectedItemId = '';

  CrokettConfiguration.login()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = false,
        screen = LOGIN,
        selectedItemId = '';

  CrokettConfiguration.signUp()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = false,
        screen = SIGN_UP,
        selectedItemId = '';

  CrokettConfiguration.googleSignIn()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = false,
        screen = GOOGLE_SIGN_IN,
        selectedItemId = '';

  CrokettConfiguration.doWeDeliver()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = DO_WE_DELIVER,
        selectedItemId = '';

  CrokettConfiguration.foodPreferences()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = FOOD_PREFERENCES,
        selectedItemId = '';

  CrokettConfiguration.home()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = HOME,
        selectedItemId = '';

  CrokettConfiguration.homeFeatured(String featuredId)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = FEATURED,
        selectedItemId = featuredId;

  CrokettConfiguration.homeUpcomingBox(String boxOrderId)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = UPCOMING_BOX,
        selectedItemId = boxOrderId;

  CrokettConfiguration.homeSelectedForYou(String selectedForYouId)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = SELECTED_FOR_YOU,
        selectedItemId = selectedForYouId;

  CrokettConfiguration.profile()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = PROFILE,
        selectedItemId = '';

  CrokettConfiguration.boxes()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = BOXES,
        selectedItemId = '';

  CrokettConfiguration.selectedBox(String boxOrderId)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = SELECTED_BOX,
        selectedItemId = boxOrderId;

  CrokettConfiguration.recipes()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = RECIPES,
        selectedItemId = '';

  // CrokettConfiguration.oldRecipes() // When an old recipe is selected it will just use the selectedRecipe route below
  //     : unknown = false,
  //       splashPageFinished = true,
  //       loggedIn = true,
  //       screen = OLD_RECIPES,
  //       selectedItemId = '';

  CrokettConfiguration.selectedRecipe(String recipeId)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = SELECTED_RECIPE,
        selectedItemId = recipeId;

  CrokettConfiguration.cookshop()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = COOKSHOP,
        selectedItemId = '';

  CrokettConfiguration.selectedCookshopItem(String cookshopItem)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = SELECTED_COOKSHOP_ITEM,
        selectedItemId = cookshopItem;

  CrokettConfiguration.tipsAndTricks()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = TIPS_AND_TRICKS,
        selectedItemId = '';

  CrokettConfiguration.selectedTipsAndTricks(String tipOrTrick)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = SELECTED_TIPS_AND_TRICKS,
        selectedItemId = tipOrTrick;

  CrokettConfiguration.help()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = HELP,
        selectedItemId = '';

  CrokettConfiguration.settings()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        screen = SETTINGS,
        selectedItemId = '';

  bool get isUnknownPage => unknown == true;

  bool get isSplashPage =>
      unknown == false && loggedIn == false && splashPageFinished == false;

  bool get isLoginPage =>
      unknown == false && loggedIn == false && splashPageFinished == true;

  bool get isSignUpPage =>
      unknown == false &&
      loggedIn == false &&
      splashPageFinished == true &&
      screen == SIGN_UP &&
      selectedItemId == '';

  bool get isGoogleSignInPage =>
      unknown == false &&
      loggedIn == false &&
      splashPageFinished == true &&
      screen == GOOGLE_SIGN_IN &&
      selectedItemId == '';

  bool get isDoWeDeliverPage =>
      unknown == false &&
      loggedIn == true &&
      splashPageFinished == true &&
      screen == DO_WE_DELIVER &&
      selectedItemId == '';

  bool get isFoodPreferencesPage =>
      unknown == false &&
      loggedIn == true &&
      splashPageFinished == true &&
      screen == FOOD_PREFERENCES &&
      selectedItemId == '';

  bool get isHomePage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      screen == HOME &&
      selectedItemId == '';

  bool get isHomeFeaturedPage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      screen == FEATURED &&
      selectedItemId != '';

  bool get isHomeUpcomingBoxPage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      screen == UPCOMING_BOX &&
      selectedItemId != '';

  bool get isHomeSelectedForYouPage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      screen == SELECTED_FOR_YOU &&
      selectedItemId != '';

  bool get isProfilePage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      screen == PROFILE &&
      selectedItemId == '';

  bool get isBoxesPage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      screen == BOXES &&
      selectedItemId == '';

  bool get isSelectedBoxPage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      screen == UPCOMING_BOX &&
      selectedItemId != '';

  bool get isRecipesPage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      screen == RECIPES &&
      selectedItemId == '';

  bool get isSelectedRecipePage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      screen == SELECTED_RECIPE &&
      selectedItemId != '';

  bool get isCookshopPage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      screen == COOKSHOP &&
      selectedItemId == '';

  bool get isSelectedCookshopPage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      screen == SELECTED_COOKSHOP_ITEM &&
      selectedItemId != '';

  bool get isTipsAndTricksPage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      screen == TIPS_AND_TRICKS &&
      selectedItemId == '';

  bool get isSelectedTipsAndTricksPage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      screen == SELECTED_TIPS_AND_TRICKS &&
      selectedItemId != '';

  bool get isHelpPage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      screen == HELP &&
      selectedItemId == '';

  bool get isSettingsPage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      screen == SETTINGS &&
      selectedItemId == '';
}

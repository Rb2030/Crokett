enum MainMenuOption { // All the options in the drawer menu
  profile,
  home,
  homeFeatured,
  homeUpcomingBox,
  homeSelectedForYou,
  boxes,
  recipes,
  cookshop,
  tipsAndTricks,
  help,
  settings
}

class CrokettConfiguration {
  final bool unknown;
  final bool splashPageFinished;
  final bool loggedIn;
  final MainMenuOption mainMenuOption;
  final String selectedItemId;

  CrokettConfiguration.splash()
      : unknown = false,
        splashPageFinished = false,
        loggedIn = false,
        mainMenuOption = MainMenuOption.home,
        selectedItemId = '';

  CrokettConfiguration.loginSignUp() // This will have the sign up and the google login on the same page
      : unknown = false,
        splashPageFinished = true,
        loggedIn = false,
        mainMenuOption = MainMenuOption.home,
        selectedItemId = '';

  CrokettConfiguration.home()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.home,
        selectedItemId = '';

  CrokettConfiguration.homeFeatured(String featuredId)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.home,
        selectedItemId = featuredId;

  CrokettConfiguration.homeUpcomingBox(String boxOrderId)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.home,
        selectedItemId = boxOrderId;

  CrokettConfiguration.homeSelectedForYou(String selectedForYouId)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.home,
        selectedItemId = selectedForYouId;

  CrokettConfiguration.profile()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.profile,
        selectedItemId = '';

  CrokettConfiguration.boxes()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.boxes,
        selectedItemId = '';

  CrokettConfiguration.selectedBox(String boxOrderId)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.boxes,
        selectedItemId = boxOrderId;

  CrokettConfiguration.recipes()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.recipes,
        selectedItemId = '';

  // CrokettConfiguration.oldRecipes() // When an old recipe is selected it will just use the selectedRecipe route below
  //     : unknown = false,
  //       splashPageFinished = true,
  //       loggedIn = true,
  //       mainMenuOption = MainMenuOption.recipes,
  //       selectedItemId = '';

  CrokettConfiguration.selectedRecipe(String recipeId)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.recipes,
        selectedItemId = recipeId;

  CrokettConfiguration.cookshop()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.cookshop,
        selectedItemId = '';

  CrokettConfiguration.selectedCookshopItem(String cookshopItem)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.cookshop,
        selectedItemId = cookshopItem;

  CrokettConfiguration.tipsAndTricks()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.tipsAndTricks,
        selectedItemId = '';

  CrokettConfiguration.selectedTipsAndTricks(String tipOrTrick)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.tipsAndTricks,
        selectedItemId = tipOrTrick;

  CrokettConfiguration.help()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.help,
        selectedItemId = '';

  CrokettConfiguration.settings()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.settings,
        selectedItemId = '';

  bool get isUnknownPage => unknown == true;

  bool get isSplashPage =>
      unknown == false && loggedIn == false && splashPageFinished == false;

  bool get isLoginSignUpPage =>
      unknown == false && loggedIn == false && splashPageFinished == true;

  bool get isHomePage =>
      unknown == false && mainMenuOption == MainMenuOption.home;

  bool get isHomeFeaturedPage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      mainMenuOption == MainMenuOption.homeFeatured &&
      selectedItemId != '';

  bool get isHomeUpcomingBoxPage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      mainMenuOption == MainMenuOption.homeUpcomingBox &&
      selectedItemId != '';
  
  bool get isHomeSelectedForYouPage =>
    unknown == false &&
    splashPageFinished == true &&
    loggedIn == true &&
    mainMenuOption == MainMenuOption.homeSelectedForYou &&
    selectedItemId != '';

  bool get isProfilePage =>
      unknown == false && mainMenuOption == MainMenuOption.profile;

  bool get isBoxesPage =>
      unknown == false && mainMenuOption == MainMenuOption.boxes;

  bool get isSelectedBoxPage =>
    unknown == false &&
    splashPageFinished == true &&
    loggedIn == true &&
    mainMenuOption == MainMenuOption.boxes &&
    selectedItemId != '';

  bool get isRecipePage =>
      unknown == false && mainMenuOption == MainMenuOption.recipes;

  bool get isSelectedRecipePage =>
    unknown == false &&
    splashPageFinished == true &&
    loggedIn == true &&
    mainMenuOption == MainMenuOption.recipes &&
    selectedItemId != '';

  bool get isCookshopPage =>
      unknown == false && mainMenuOption == MainMenuOption.cookshop;

  bool get isSelectedCookshopPage =>
    unknown == false &&
    splashPageFinished == true &&
    loggedIn == true &&
    mainMenuOption == MainMenuOption.cookshop &&
    selectedItemId != '';

  bool get isTipsAndTricksPage =>
      unknown == false && mainMenuOption == MainMenuOption.tipsAndTricks;

  bool get isSelectedTipsAndTricksPage =>
    unknown == false &&
    splashPageFinished == true &&
    loggedIn == true &&
    mainMenuOption == MainMenuOption.tipsAndTricks &&
    selectedItemId != '';

  bool get isHelpPage =>
      unknown == false && mainMenuOption == MainMenuOption.help;

  bool get isSettingsPage =>
      unknown == false && mainMenuOption == MainMenuOption.settings;
}


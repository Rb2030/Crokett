enum MainMenuOption {
  profile,
  home,
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
  final String featuredId;
  final String selectedForYouId;
  final String recipeId;
  final String boxOrderId;
  final String cookshopItemId;
  final String tipsAndTrickId;

  CrokettConfiguration.splash()
      : unknown = false,
        splashPageFinished = false,
        loggedIn = false,
        mainMenuOption = MainMenuOption.home,
        featuredId = '',
        selectedForYouId = '',
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = '';

  CrokettConfiguration.loginSignUp() // This will have the sign up and the google login on the same page
      : unknown = false,
        splashPageFinished = true,
        loggedIn = false,
        mainMenuOption = MainMenuOption.home,
        featuredId = '',
        selectedForYouId = '',
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = '';

  CrokettConfiguration.home()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.home,
        featuredId = '',
        selectedForYouId = '',
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = '';

  CrokettConfiguration.homeFeatured(String featuredId)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.home,
        featuredId = featuredId,
        selectedForYouId = '',
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = '';

  CrokettConfiguration.homeUpcomingBox(String boxOrderId)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.home,
        featuredId = '',
        selectedForYouId = '',
        boxOrderId = boxOrderId,
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = '';

    CrokettConfiguration.homeSelectedForYou(String selectedForYouId)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.home,
        featuredId = '',
        selectedForYouId = selectedForYouId,
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = '';

  CrokettConfiguration.profile()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.profile,
        featuredId = '',
        selectedForYouId = '',        
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = '';

  CrokettConfiguration.boxes()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.boxes,
        featuredId = '',
        selectedForYouId = '',  
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = '';

  CrokettConfiguration.selectedBox(String boxOrderId)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.boxes,
        featuredId = '',
        selectedForYouId = '',  
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = '';

  CrokettConfiguration.recipes()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.recipes,
        featuredId = '',
        selectedForYouId = '',  
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = '';

  CrokettConfiguration.oldRecipes() // When an old recipe is selected it will just use the selectedRecipe route below
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.recipes,
        featuredId = '',
        selectedForYouId = '',  
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = '';

  CrokettConfiguration.selectedRecipe(String recipeId)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.recipes,
        featuredId = '',
        selectedForYouId = '',  
        boxOrderId = '',
        recipeId = recipeId,
        cookshopItemId = '',
        tipsAndTrickId = '';

  CrokettConfiguration.cookshop()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.cookshop,
        featuredId = '',
        selectedForYouId = '',  
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = '';

  CrokettConfiguration.selectedCookshopItem(String cookshopItem)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.cookshop,
        featuredId = '',
        selectedForYouId = '',
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = cookshopItem,
        tipsAndTrickId = '';

  CrokettConfiguration.tipsAndTricks()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.tipsAndTricks,
        featuredId = '',
        selectedForYouId = '',  
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = '';

  CrokettConfiguration.selectedTipsAndTricks(String tipOrTrick)
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.tipsAndTricks,
        featuredId = '',
        selectedForYouId = '',  
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = tipOrTrick;

  CrokettConfiguration.help()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.help,
        featuredId = '',
        selectedForYouId = '',  
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = '';

  CrokettConfiguration.settings()
      : unknown = false,
        splashPageFinished = true,
        loggedIn = true,
        mainMenuOption = MainMenuOption.settings,
        featuredId = '',
        selectedForYouId = '',  
        boxOrderId = '',
        recipeId = '',
        cookshopItemId = '',
        tipsAndTrickId = '';

  bool get isUnknown => unknown == true;

  bool get isSplashPage =>
      unknown == false && loggedIn == false && splashPageFinished == false;

  bool get isLoginSignUpPage =>
      unknown == false && loggedIn == false && splashPageFinished == true;

  bool get isHomePage =>
      unknown == false &&
      mainMenuOption == MainMenuOption.home;

  bool get isColorPage =>
      unknown == false &&
      splashPageFinished == true &&
      loggedIn == true &&
      boxOrderId == '' &&
      recipeId == '' &&
      cookshopItemId == '' &&
      tipsAndTrickId == '';

  bool get isShapePage =>
      unknown == false &&
      loggedIn == true &&
      colorCode != null &&
      shapeBorderType != null;
}


const String SplashPath = '/splash';
const String OnBoardingPath = '/on_boarding';
const String LoginPath = '/login';
const String SignUpPath = '/sign_up';
const String MainMenuPath = '/details';

enum Pages {
  Splash,
  OnBoarding,
  Login,
  SignUp,
  MainMenu
}

class PageConfiguration {
  final String key;
  final String path;
  final Pages uiPage;

  const PageConfiguration(
      {required this.key, required this.path, required this.uiPage});
}

const PageConfiguration SplashPageConfig =
    PageConfiguration(key: 'Splash', path: SplashPath, uiPage: Pages.Splash);
    //
const PageConfiguration OnBoardingPageConfig =
    PageConfiguration(key: 'OnBoarding', path: OnBoardingPath, uiPage: Pages.OnBoarding);
    //
const PageConfiguration LoginPageConfig =
    PageConfiguration(key: 'Login', path: LoginPath, uiPage: Pages.Login);
    //
const PageConfiguration SignUpPageConfig = PageConfiguration(
    key: 'SignUp', path: SignUpPath, uiPage: Pages.SignUp);
    //
const PageConfiguration MainMenuPageConfig = PageConfiguration(
    key: 'MainMenu', path: MainMenuPath, uiPage: Pages.MainMenu);

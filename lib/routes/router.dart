import 'package:crokett/features/login/presentation/page_structures/login_page.dart';
import 'package:crokett/features/on_boarding/page_structures/onboarding_page.dart';
import 'package:crokett/features/sign_up/page_structures/sign_up_page.dart';
import 'package:crokett/features/splash_screen/presentation/page_structures/splash_page.dart';
import 'package:auto_route/auto_route_annotations.dart';


@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
    routes: <AutoRoute>[
      MaterialRoute(page: SplashPage, initial: true),
      MaterialRoute(page: OnBoardingPage),
      MaterialRoute(page: LoginPage),
      MaterialRoute(page: SignUpPage),
      // MaterialRoute(page: EmailAlreadyInUsePage),
      // MaterialRoute(page: MainMenuMenus),
      // MaterialRoute(page: MainMenuRecipes),
      // MaterialRoute(page: MainMenuTipsAndTricks),
      // MaterialRoute(page: MainMenuEssentialKit),
      // MaterialRoute(page: MainMenuChefsAndRestaurants),
    ],
)

class $Router {}
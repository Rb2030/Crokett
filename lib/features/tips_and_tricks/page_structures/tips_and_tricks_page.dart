import 'package:crokett/features/tips_and_tricks/page_widgets/mobile/tips_and_tricks_screen.dart';
import 'package:crokett/injection.dart';
import 'package:crokett/routes/app_shell.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TipsAndTricksPage extends Page {
  final Function(String) nextScreen;

  TipsAndTricksPage({required this.nextScreen}) : super(key: ValueKey(TIPS_AND_TRICKS));  

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return AppShell(TipsAndTricksScreen(nextScreen: nextScreen), nextScreen);
      },
    );
  }
}

// import 'package:crokett/features/home/blocs/home_bloc/home_bloc.dart';
// import 'package:crokett/features/tips_and_tricks/page_widgets/mobile/tips_and_tricks_screen.dart';
// import 'package:crokett/routes/app_shell.dart';
// import 'package:crokett/routes/crokett_configuration.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../injection.dart';

// class TipsAndTricksPage extends Page {
//   final Function(String) nextScreen;

//   TipsAndTricksPage({required this.nextScreen}) : super(key: ValueKey(HOME));  

//   @override
//   Route createRoute(BuildContext context) {
//     return PageRouteBuilder(
//       settings: this,
//       pageBuilder: (context, animation, animation2) {
//         var curveTween = CurveTween(curve: Curves.easeIn);
//         return FadeTransition(
//           opacity: animation.drive(curveTween),
//           child: BlocProvider(
//           lazy: false,
//           create: (context) => getIt<HomeBloc>(),            
//         child: AppShell(TipsAndTricksScreen(nextScreen: nextScreen), nextScreen)
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:crokett/features/help/blocs/help_bloc/help_bloc.dart';
import 'package:crokett/features/help/page_widgets/mobile/help_screen.dart';
import 'package:crokett/injection.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HelpPage extends Page {
  final Function(String) nextScreen;

  HelpPage({required this.nextScreen}) : super(key: ValueKey(HELP));  

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
        builder: (BuildContext context) {
        return BlocProvider(
          lazy: false,
          create: (context) => getIt<HelpBloc>(),
          child: HelpScreen(nextScreen: nextScreen),
        );
      },
    );
  }
}
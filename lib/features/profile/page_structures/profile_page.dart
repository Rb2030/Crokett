import 'package:crokett/features/profile/blocs/profile_bloc/profile_bloc.dart';
import 'package:crokett/features/profile/page_widgets/mobile/profile_screen.dart';
import 'package:crokett/injection.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends Page {
  final Function(String) nextScreen;
  final Function(String) previousScreen;

  ProfilePage({required this.nextScreen, required this.previousScreen}) : super(key: ValueKey(HELP));  

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
        builder: (BuildContext context) {
        return BlocProvider(
          lazy: false,
          create: (context) => getIt<ProfileBloc>(),
          child: ProfileScreen(nextScreen: nextScreen, previousScreen: previousScreen),
        );
      },
    );
  }
}
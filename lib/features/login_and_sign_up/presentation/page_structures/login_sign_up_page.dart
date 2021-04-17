import 'package:crokett/features/login_and_sign_up/application/entry_screen_bloc/entry_screen_bloc.dart';
import 'package:crokett/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => getIt<EntryScreenBloc>(),
            child: Container() //TODO: Put MaterialPageRoute with screen child here
            ),
        );
  }
}

import 'package:crokett/core/global/theme/theme_data.dart';
import 'package:crokett/features/login_and_sign_up/blocs/auth_bloc/auth_bloc.dart';
import 'package:crokett/injection.dart';
import 'package:crokett/routes/crokett_route_info_parser.dart';
import 'package:crokett/routes/crokett_router_delegate.dart';
import 'package:crokett/routes/router_bloc/router_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.dev);
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(CrokettApp());
}

class CrokettApp extends StatefulWidget {
  @override
  _CrokettAppState createState() => _CrokettAppState();
}

class _CrokettAppState extends State<CrokettApp> {
  CrokettRouterDelegate _routerDelegate = CrokettRouterDelegate();
  CrokettRouteInformationParser _routeInformationParser = CrokettRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => getIt<AuthBloc>()..add(AppStarted()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => getIt<RouterBloc>(),
        ),
      ],
      child: MaterialApp.router(
      title: 'Crokett',
      theme: globalAppThemeData,
        routerDelegate: _routerDelegate,
        routeInformationParser: _routeInformationParser,
      ),
    );
  }
}

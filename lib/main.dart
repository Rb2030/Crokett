import 'package:crokett/core/global/theme/theme_data.dart';
import 'package:crokett/injection.dart';
import 'package:crokett/routes/route_information_parser.dart';
import 'package:crokett/routes/router_delegate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  CrokettRouteInformationParser _routeInformationParser =
      CrokettRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Crokett',
      theme: globalAppThemeData,
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,
    );
  }
}

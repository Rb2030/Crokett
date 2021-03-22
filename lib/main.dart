import 'package:crokett/core/global/theme/theme_data.dart';
import 'package:crokett/injection.dart';
// import 'package:crokett/link_stream.dart'; // Needed for the linksURI
import 'package:crokett/routes/back_dispatcher.dart';
import 'package:crokett/routes/route_parser.dart';
import 'package:crokett/routes/router_delegate.dart';
import 'package:crokett/routes/ui_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

final delegate = CrokettRouterDelegate();
final parser = RouteParser();
CrokettBackButtonDispatcher backButtonDispatcher;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.dev);
  // delegate = await linkStreamState(delegate); // Needed for routes with URI and delegate above needs to be a var not a final
  configureRoots();
  await Firebase.initializeApp();
  runApp(CrokettApp());
}

configureRoots() {
  delegate.setNewRoutePath(SplashPageConfig);
  backButtonDispatcher = CrokettBackButtonDispatcher(delegate);
  Get.put(delegate);
}

class CrokettApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Crokett',
      theme: globalAppThemeData,
      backButtonDispatcher: backButtonDispatcher,
      routerDelegate: delegate,
      routeInformationParser: parser,
    );
  }
}

import 'package:crokett/core/global/theme/theme_data.dart';
import 'package:crokett/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.dev);
  await Firebase.initializeApp();
  runApp(CrokettApp());
}

class CrokettApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crokett',
      theme: globalAppThemeData,
    );
  }
}

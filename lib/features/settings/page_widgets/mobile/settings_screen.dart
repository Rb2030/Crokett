import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/core/global/widgets/app_bar_back_button.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function(String) nextScreen;
  final Function(String) previousScreen;

  SettingsScreen({required this.nextScreen, required this.previousScreen}) : super();

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SettingsScreen> {
  late Function(String) nextScreen;
  late Function(String) previousScreen;

  @override
  void initState() {
    super.initState();
    nextScreen = widget.nextScreen;
    previousScreen = widget.previousScreen;
  }

  @override
  Widget build(BuildContext context) {
    final ResponsiveScreenConfig rsc = ResponsiveScreenConfig(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: AppBarBackButton(
          color: Colors.black,
          previousScreen: () {
            previousScreen(APPSHELL);
          },
        ),
        title: Text(Constants.settings),
      ),
      body: Container(
        color: Colors.pink,
        child: Center(
          child: Text(
            'SETTINGS',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

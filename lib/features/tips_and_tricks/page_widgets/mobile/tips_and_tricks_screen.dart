import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:flutter/material.dart';

class TipsAndTricksScreen extends StatefulWidget {  // This does not need a material page route as it is part of home
  final Function(String)? nextScreen;

  TipsAndTricksScreen({required this.nextScreen}) : super();

  @override
  _TipsAndTricksScreenState createState() => _TipsAndTricksScreenState();
}

class _TipsAndTricksScreenState extends State<TipsAndTricksScreen> {
  Function(String)? nextScreen;

  @override
  void initState() {
    super.initState();
    nextScreen = widget.nextScreen;
  }

  @override
  Widget build(BuildContext context) {
    final ResponsiveScreenConfig rsc = ResponsiveScreenConfig(context);

    return Center(
        child: Container(
            width: rsc.rH(20), height: rsc.rW(60), color: Colors.teal));
  }
}


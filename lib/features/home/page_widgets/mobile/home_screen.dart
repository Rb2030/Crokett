import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {  // This does not need a material page route as it is part of home
  final Function(String) nextScreen;

  HomeScreen({required this.nextScreen}) : super();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Function(String) nextScreen;

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
            width: rsc.rH(20), height: rsc.rW(60), color: Colors.purple));
  }
}

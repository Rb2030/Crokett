import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:flutter/material.dart';

class RecipesScreen extends StatefulWidget {
  final Function(String)? nextScreen;

  RecipesScreen({required this.nextScreen}) : super();

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> with TickerProviderStateMixin {
  Function(String)? nextScreen;

  @override
  void initState() {
    super.initState();
    nextScreen = widget.nextScreen;
  }

  @override
  Widget build(BuildContext context) { // NOTE:- THIS IS GOING TO NEED THE MATERIAL PAGE ROUTE TO NAVIGATE TO FEATURED/SELECTED FOR YOU/UPCOMING BOXES NAVIGATION
    final ResponsiveScreenConfig rsc = ResponsiveScreenConfig(context);

    return Center(
        child: Container(
            width: rsc.rH(20), height: rsc.rW(60), color: Colors.yellow));
  }
}

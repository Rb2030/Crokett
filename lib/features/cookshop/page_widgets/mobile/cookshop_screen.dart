import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:flutter/material.dart';

class CookShopScreen extends StatefulWidget {
  final Function(String)? nextScreen;

  CookShopScreen({required this.nextScreen}) : super();

  @override
  _CookShopScreenState createState() => _CookShopScreenState();
}

class _CookShopScreenState extends State<CookShopScreen> with TickerProviderStateMixin {
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
            width: rsc.rH(20), height: rsc.rW(60), color: Colors.orange));
  }
}

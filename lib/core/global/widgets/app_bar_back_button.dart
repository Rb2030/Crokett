import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppBarBackButton extends StatelessWidget {
  final Color? color;
  final Function() previousScreen;

  const AppBarBackButton(
      {Key? key, required this.color, required this.previousScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? SizedBox.shrink()
        : BackButton(
            color: color!,
            onPressed: previousScreen,
          );
  }
}

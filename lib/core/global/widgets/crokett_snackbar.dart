import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/core/global/helpers/ui_helper.dart';
import 'package:flutter/material.dart';

class CrokettSnackbar extends SnackBar {
  final String text;
  final VoidCallback? onPressed;
  final String? buttonLabel;

  CrokettSnackbar({
    Key? key,
    required this.text,
    this.onPressed,
    this.buttonLabel
  }) : super(key: key, content: Text(text, textAlign: TextAlign.center));

  Widget build(BuildContext context) {
    final ResponsiveScreenConfig rsc = ResponsiveScreenConfig(context);
    return SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      width: rsc.rW(60),
      margin: EdgeInsets.all(UIHelper.buttonPadding),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
        label: buttonLabel!,
        onPressed: () {
          onPressed!();
        },
      ),
    );
  }
}

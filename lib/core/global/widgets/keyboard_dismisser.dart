import 'package:flutter/material.dart';
import 'package:crokett/core/global/globals/globals.dart' as globals;

Widget keyboardDismisser({required BuildContext context, required Widget child}) {
  final gesture = GestureDetector(
    onTap: () {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        FocusManager.instance.primaryFocus!.unfocus();
        debugPrint("Unfocused!");
        globals.isUnfocused = true;
      }
    },
    child: child,
  );
  return gesture;
}

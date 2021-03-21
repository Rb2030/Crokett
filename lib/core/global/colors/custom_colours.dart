import 'package:flutter/material.dart';

class CustomColours extends InheritedWidget {
  static CustomColours of(BuildContext context) => context. dependOnInheritedWidgetOfExactType<CustomColours>();

  const CustomColours({Widget child, Key key}): super(key: key, child: child);

// Main Colours

  static const Color purple = Color(0xFF58426C);
  static const Color blue = Color(0xFF4FA2D2);
  static const Color aqua = Color(0xFF41CAC6);
  static const Color yellow = Color(0xFFF7C656);
  static const Color orange = Color(0xFFF29442);
  static const Color red = Color(0xFFED6A68);
  static const Color pink = Color(0xFFCA5BA1);
  static const Color grey = Color(0xFFA1A1A1);
  static const Color lightGrey = Color(0xFFF2F2F2);
  static const Color crokettYellow = Color(0xFFF6D331);

  @override
  bool updateShouldNotify(CustomColours oldWidget) => false;
}
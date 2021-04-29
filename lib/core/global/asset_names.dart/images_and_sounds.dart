import 'package:flutter/material.dart';

class Images extends InheritedWidget {
  static Images? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<Images>();

  Images({Widget? child, Key? key}) : super(key: key, child: child!);

  // Images

  static const String imageCrokettLogo = 'assets/images/crokett_logo.svg';
  static const String imageHobPower1 = 'assets/images/crokett_symbol_1.svg';
  static const String imageHobPower2 = 'assets/images/crokett_symbol_2.svg';
  static const String googleG = 'assets/images/google_g.svg';
  static const String imageHome = 'assets/images/icon-home.svg';
  static const String imageBoxes = 'assets/images/icon-boxes.svg';
  static const String imageCookshop = 'assets/images/icons-cookshop.svg';
  static const String imageEdit = 'assets/images/icon-edit.svg';
  static const String imageHelp = 'assets/images/icon-help.svg';
  static const String imageleg = 'assets/images/icon-leg.svg';
  static const String imagelgBox = 'assets/images/icon-lg-box.svg';
  static const String imagelgSummary = 'assets/images/icon-lg-summary.svg';
  static const String imageRecipes = 'assets/images/icon-recipes.svg';
  static const String imageSettings = 'assets/images/icon-settings.svg';
  static const String imageSMHelp = 'assets/images/icon-sm-help.svg';
  static const String imageTipsAndTricks = 'assets/images/icon-tips-tricks.svg';
  static const String imageIllustrationNoOrders = 'assets/images/illustration-no-orders.svg';
  static const String imageJ = 'assets/images/j.svg';
  static const String imageR = 'assets/images/r.svg';


  @override
  bool updateShouldNotify(Images oldWidget) => false;
}

class Sounds extends InheritedWidget {
  static Sounds? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<Sounds>();

  Sounds({Widget? child, Key? key}) : super(key: key, child: child!);

  // Sounds

  static const String soundHobClick = 'audio/click_click_click.mp3';

  @override
  bool updateShouldNotify(Sounds oldWidget) => false;
}

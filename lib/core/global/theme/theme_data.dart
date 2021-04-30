import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../helpers/ui_helper.dart';

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.grey;
  }
  return Colors.black;
}

final globalAppThemeData = ThemeData(
  primaryColorLight: Colors.white,
  brightness: Brightness.light,
  primaryColor: Colors.white,
  accentColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(color: Colors.white),
  backgroundColor: Colors.white,
  canvasColor: Colors.white,
  buttonColor: Colors.black,
  buttonBarTheme: const ButtonBarThemeData(alignment: MainAxisAlignment.center),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(UIHelper.buttonPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UIHelper.buttonCornerRadius),
        ),
        minimumSize: Size(UIHelper.buttonMinWidth, UIHelper.buttonMinHeight),
        primary: Colors.black,
        onSurface: Colors.grey),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  textTheme:
      textTheme().apply(displayColor: Colors.black, bodyColor: Colors.black),
);

TextTheme textTheme() {
  return TextTheme(
    // Used for the Crokett splash title
    headline1: TextStyle(
        fontFamily: Constants.vorkursFont,
        fontSize: 62,
        fontWeight: FontWeight.w400,
        letterSpacing: -3),
    // Main title
    headline2: TextStyle(
        fontFamily: Constants.vorkursFont,
        fontSize: 42,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5),
    // Poppins
    headline3: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 36,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2),
    // Poppins
    headline4: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 30,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2),
    // Poppins
    headline5: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 28,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2),
    // Poppins
    headline6: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 23,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    // Used for inside textFields
    subtitle1: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 22,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1),
    // Used for sub titles errors, notifications etc
    subtitle2: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1),
    // Text buttons e.g Forgotten sign in details?, Labelling above textFields, main text size
    bodyText1: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1),
    // Information & large bodies of text
    bodyText2: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1),
    //
    button: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    //
    caption: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1),
    //
    overline: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1),
  );
}

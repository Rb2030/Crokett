import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../helpers/ui_helper.dart';

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
  inputDecorationTheme: InputDecorationTheme(
      errorStyle: const TextStyle(color: Colors.black),
      contentPadding: const EdgeInsets.fromLTRB(
          UIHelper.textFieldPadding * 2,
          UIHelper.textFieldPadding,
          UIHelper.textFieldPadding,
          UIHelper.textFieldPadding),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIHelper.textFieldBorderRadius),
          borderSide: const BorderSide(
              color: Colors.black,
              width: UIHelper.textFieldBorderWidthFocused)),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              // ignore: avoid_redundant_argument_values
              color: Colors.black,
              width: UIHelper.textFieldBorderWidthDisabled))),
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
        letterSpacing: 0.25),
    // Poppins
    headline4: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 30,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25),
    // Poppins
    headline5: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 28,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    // Poppins
    headline6: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 23,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15),
    // Used for inside textFields
    subtitle1: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    // Used for sub titles errors, notifications etc
    subtitle2: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    // Text buttons e.g Forgotten sign in details?, Labelling above textFields, main text size
    bodyText1: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    // Information & large bodies of text
    bodyText2: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    //
    button: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    //
    caption: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    //
    overline: TextStyle(
        fontFamily: Constants.poppinsFont,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
  );
}

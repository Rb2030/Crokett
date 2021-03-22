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
  buttonTheme: ButtonThemeData(
      padding: const EdgeInsets.all(UIHelper.buttonPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UIHelper.buttonCornerRadius),
        // ignore: avoid_redundant_argument_values
        /*side: const BorderSide(color: Colors.black)*/
      ),
      minWidth: UIHelper.buttonMinWidth,
      height: UIHelper.buttonMinHeight,
      buttonColor: Colors.black,
      // colorScheme: ColorScheme(secondary: Colors.black), /// -------------- Need to check this to see if the text on white buttons is black
      disabledColor: Colors.grey),
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
    // Used for the Crokett title
    headline1: TextStyle(
        fontFamily: Constants.carinoSansFont,
        fontSize: 70,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5),
    // Main title
    headline2: TextStyle(
        fontFamily: Constants.carinoSansFont,
        fontSize: 39,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25),
    //
    headline3: TextStyle(
        fontFamily: Constants.carinoSansFont,
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25),
    //
    headline4: TextStyle(
        fontFamily: Constants.carinoSansFont,
        fontSize: 30,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25),
    //
    headline5: TextStyle(
        fontFamily: Constants.carinoSansFont,
        fontSize: 28,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    //
    headline6: TextStyle(
        fontFamily: Constants.jostFont,
        fontSize: 23,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15),
    // Used for inside textFields
    subtitle1: TextStyle(
        fontFamily: Constants.jostFont,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    // Used for sub titles errors, notifications etc
    subtitle2: TextStyle(
        fontFamily: Constants.jostFont,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    // Text buttons e.g Forgotten sign in details?, Labelling above textFields, main text size
    bodyText1: TextStyle(
        fontFamily: Constants.jostFont,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    // Information & large bodies of text
    bodyText2: TextStyle(
        fontFamily: Constants.jostFont,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    //
    button: TextStyle(
        fontFamily: Constants.jostFont,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15),
    //
    caption: TextStyle(
        fontFamily: Constants.jostFont,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    //
    overline: TextStyle(
        fontFamily: Constants.carinoSansFont,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
  );
}

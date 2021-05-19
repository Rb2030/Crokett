import 'package:flutter/material.dart';

class Constants extends InheritedWidget {
  static Constants? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Constants>();

  Constants({Widget? child, Key? key}) : super(key: key, child: child!);

// General

  static const String crokett = 'Crokett';
  static const String serverError = 'Server error, please try again later.';
  static const String ok = 'OK';
  static const String next = 'Next';
  static const String submit = 'Submit';

// Sign In Screen

  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String username = 'Username';
  static const String signUp = 'Sign Up';
  static const String postalCode = 'Postal Code';
  static const String signInWithGoogle = 'Sign In with Google';
  static const String logIn = 'Log In';
  static const String country = 'Country';
  static const String backToLogin = 'Back to Login';
  static const String notGotAccount = 'Not got an account with us';
  static const String forgotPassword = 'Forgot Password?';
  static const String emailAlreadyInUseTextFieldError = 'Email Already In Use';
  static const String cancelledByUser = 'Cancelled by user';
  static const String emailAlreadyInUse =
      'Email already registered. Please sign in by pressing back, or if you wish to reset your password press "Forgotten sign in details?".';
  static const String invalidUsernameAndPasswordCombo =
      'Invalid username and password combination';
  static const String pleaseTryAgain = 'Please try again';
  static const String usernameTaken =
      'This username has already been taken, please choose another unique one';
  static const String enterEmailToResetPassword =
      'Please enter your email address, you will be sent a link which will enable you to create a new password.';
  static const String passwordResetSentToEmail =
      'Please check your email for a link to reset your password.';
  static const String errorSendingEmail =
      'There was an error when attempting to send you an email.';

// Register Screen

  static const String emailInformation =
      'Please ensure that you do not leave any blank spaces and your email is in the correct format e.g crokett@mail.com.';
  static const String passwordInformation =
      '''Please ensure that the password has at least.. 
      \n• one capital letter, 
      \n• one number, 
      \n• one special character, 
      \n• no blank spaces and is at least 6 characters long.''';
  static const String passwordsMustMatch = 'Please ensure passwords match';
  static const String usernameInformation =
      "Please select a username which is unique. This will be linked to your account so please refrain from using any profanity.";
  static const String unableToRegister = "Unable to register";
  static const String postalInformation =
      "Please ensure your postal code is in the correct format. E.g SW1A 1AA.";
  static const String countryInformation =
      "Please select the country in which you reside";
  // Main Menu

  static const String home = "Home";
  static const String profile = "Profile";
  static const String boxes = "Boxes";
  static const String recipes = "Recipes";
  static const String cookshop = "Cookshop";
  static const String tipsAndTricks = "Tips and Tricks";
  static const String help = "Help";
  static const String settings = "Settings";

// Font

  static const String vorkursFont = 'Vorkurs';
  static const String poppinsFont = 'Poppins';

// Hive Boxes

  static const String hiveFirstLaunchOfApp = 'first_launch';
  static const String hiveShowOnboarding = 'show_on_boarding';
  static const String hiveUserToken = 'hive_user_token';

// Failures

  static const String failureServer =
      'There was an error with the server. Please try again later';
  static const String noEmailFound =
      'We could not find an account with that information. Please try registering again, or contact our help team for more info.';
  static const String failureCache =
      'There was an error with the local storage. Please try again later';
  static const String failureInvalidEmail = 'Invalid email format.';
  static const String failureInvalidPassword = 'Invalid password format';
  static const String failureInvalidUsername = 'Invalid username format';
  static const String failureExceedingLength = 'Exceeded length';
  static const String failureEmptyField = 'Empty field';
  static const String failureContainsProfanity = 'Contains profanity';
  static const String failureNotAuthenticated = 'Not Authenticated';
  static const String failureCancelledByUser = 'Cancelled By User';
  static const String failureServerError = 'Server Error';
  static const String failureEmailAlreadyInUse = 'Email Already In Use';
  static const String failureUsernameAlreadyInUse = 'Username Already In Use';
  static const String failureInvalidEmailAndPasswordCombination =
      'Invalid Email and Password Combination';
  static const String failureCouldNotSetRoute = 'Could not set new route';

  @override
  bool updateShouldNotify(Constants oldWidget) => false;
}

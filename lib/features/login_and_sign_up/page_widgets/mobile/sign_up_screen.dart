import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/helpers/device_type_helper.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/core/global/helpers/ui_helper.dart';
import 'package:crokett/core/global/value_objects/countries.dart';
import 'package:crokett/core/global/widgets/app_bar_title.dart';
import 'package:crokett/core/global/widgets/app_bar_back_button.dart';
import 'package:crokett/core/global/widgets/crokett_drop_down_button.dart';
import 'package:crokett/core/global/widgets/crokett_textfield.dart';
import 'package:crokett/features/login_and_sign_up/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  final Function(String) nextScreen;
  final Function(String) previousScreen;

  SignUpScreen({required this.nextScreen, required this.previousScreen})
      : super();

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late Function(String) nextScreen;
  late Function(String) previousScreen;

  @override
  void initState() {
    super.initState();
    nextScreen = widget.nextScreen;
    previousScreen = widget.previousScreen;
  }

  @override
  Widget build(BuildContext context) {
    final ResponsiveScreenConfig rsc = ResponsiveScreenConfig(context);
    final GlobalKey _dropdownButtonKey = GlobalKey();

    final _emailTextViewController = TextEditingController(
        text: context.read<SignUpBloc>().emailAddressString);

    final _passwordTextViewController =
        TextEditingController(text: context.read<SignUpBloc>().passwordString);

    final _passwordConfirmTextViewController = TextEditingController(
        text: context.read<SignUpBloc>().passwordConfirmationString);

    final _postalCodeTextViewController = TextEditingController(
        text: context.read<SignUpBloc>().postalCodeString);

    return BlocConsumer<SignUpBloc, SignUpState>(listener: (context, state) {
      // if (state is GoogleSignInSelected) {
      //     nextScreen(GOOGLE_SIGN_IN);
      //   }
      // if (state is SignUpSelected) {
      //     nextScreen(SIGN_UP);
      // }
    }, builder: (context, state) {
      if (state is! SubmittingSignUpNewUserState ||
          state is! SignUpStateReturn) {
        return GestureDetector(
          onTap: () {
            //   this may not be neede to take focus off the text fields
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                elevation: 0,
                leading: AppBarBackButton(
                  color: Colors.black,
                  previousScreen: () {
                    previousScreen(LOGIN);
                  },
                ),
                title: AppBarTitle()),
            body: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      getDeviceType() == DeviceType.Phone
                          ? rsc.rW(10)
                          : rsc.rW(24), // Left
                      rsc.rH(4), // Top
                      getDeviceType() == DeviceType.Phone
                          ? rsc.rW(10)
                          : rsc.rW(24), // Right
                      rsc.rH(10)), // Bottom
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: rsc.rH(2)),
                      // Email
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: CrokettTextField(
                          hint: Constants.email,
                          controller: _emailTextViewController,
                          onChanged: (value) {
                            _emailTextViewController.text = value;
                            _emailTextViewController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: _emailTextViewController.text
                                        .length)); // Puts the cursor at the end of the text
                            context
                                .read<SignUpBloc>()
                                .add(EmailChanged(emailString: value));
                          },
                          inputType: TextInputType.emailAddress,
                          obscureText: false,
                          showErrorMessage:
                              context.watch<SignUpBloc>().showEmailError,
                          errorMessage: Constants.emailInformation,
                        ),
                      ),
                      SizedBox(height: UIHelper.paddingBetweenElements),
                      // Password
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: CrokettTextField(
                          hint: Constants.password,
                          controller: _passwordTextViewController,
                          onChanged: (value) {
                            _passwordTextViewController.text = value;
                            _passwordTextViewController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: _passwordTextViewController.text
                                        .length)); // Puts the cursor at the end of the text
                            context
                                .read<SignUpBloc>()
                                .add(PasswordChanged(passwordString: value));
                          },
                          inputType: TextInputType.text,
                          obscureText: true,
                          showErrorMessage:
                              context.watch<SignUpBloc>().showPasswordError,
                          errorMessage: Constants.passwordInformation,
                        ),
                      ),
                      SizedBox(height: UIHelper.paddingBetweenElements),
                      // Password Confirmation
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: CrokettTextField(
                          hint: Constants.confirmPassword,
                          controller: _passwordConfirmTextViewController,
                          onChanged: (value) {
                            _passwordConfirmTextViewController.text = value;
                            _passwordConfirmTextViewController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: _passwordConfirmTextViewController
                                        .text
                                        .length)); // Puts the cursor at the end of the text
                            context.read<SignUpBloc>().add(
                                PasswordConfirmationChanged(
                                    passwordConfirmationString: value));
                          },
                          inputType: TextInputType.text,
                          obscureText: true,
                          showErrorMessage: context
                              .watch<SignUpBloc>()
                              .showPasswordConfirmError,
                          errorMessage:
                              context.watch<SignUpBloc>().passwordsMatch
                                  ? Constants.passwordInformation
                                  : Constants.passwordsMustMatch,
                        ),
                      ),
                      SizedBox(height: UIHelper.paddingBetweenElements),
                      // Country
                      CrokettDropDownButton(
                        dropdownButtonKey: _dropdownButtonKey,
                        errorMessage: Constants.countryInformation,
                        hint: Constants.country,
                        showErrorMessage:
                            context.watch<SignUpBloc>().showCountryError,
                        listItems: [
                          Countries.UK,
                          Countries.AUSTRIA,
                          Countries.DENMARK,
                          Countries.FRANCE,
                          Countries.GERMANY,
                          Countries.IRELAND,
                          Countries.ITALY,
                          Countries.NORWAY,
                          Countries.PORTUGAL,
                          Countries.SPAIN,
                          Countries.SWEDEN,
                          Countries.SWITZERLAND
                        ],
                        onChanged: (value) {
                          context.read<SignUpBloc>().add(
                              CountryDropDownChanged(countryString: value));
                        },
                      ),
                      SizedBox(height: UIHelper.paddingBetweenElements),
                      // Postal Code
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: CrokettTextField(
                          hint: Constants.postalCode,
                          controller: _postalCodeTextViewController,
                          onChanged: (value) {
                            _postalCodeTextViewController.text = value;
                            _postalCodeTextViewController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: _postalCodeTextViewController.text
                                        .length)); // Puts the cursor at the end of the text
                            context
                                .read<SignUpBloc>()
                                .add(PostalCodeChanged(postalCode: value));
                          },
                          inputType: TextInputType.text,
                          obscureText: false,
                          showErrorMessage:
                              context.watch<SignUpBloc>().showPostalCodeError,
                          errorMessage: Constants.postalInformation,
                        ),
                      ),
                      SizedBox(height: UIHelper.paddingBetweenElements),
                      SizedBox(height: UIHelper.paddingBetweenElements),
                      ElevatedButton(
                        onPressed: () {
                          context.read<SignUpBloc>().add(SignUpNewUser());
                        },
                        child: Text(Constants.logIn),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      } else if (state is SubmittingSignUpNewUserState) {
        return Container();
      } else if (state is SignUpStateReturn) {
        return Container();
      } else {
        return Container();
      }
    });
  }
}

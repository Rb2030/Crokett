import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/helpers/device_type_helper.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/core/global/helpers/ui_helper.dart';
import 'package:crokett/core/global/widgets/crokett_snackbar.dart';
import 'package:crokett/core/global/widgets/crokett_textfield.dart';
import 'package:crokett/features/login_and_sign_up/blocs/login_bloc/login_bloc.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBottomSheetWidget extends StatefulWidget {
  final Function(String) nextScreen;

  const LoginBottomSheetWidget(
      {Key? key, required this.nextScreen})
      : super(key: key);

  @override
  _LoginBottomSheetWidgetState createState() => _LoginBottomSheetWidgetState();
}

class _LoginBottomSheetWidgetState extends State<LoginBottomSheetWidget> {
  late Function(String) nextScreen;

  @override
  void initState() {
    super.initState();
    nextScreen = widget.nextScreen;
  }

  @override
  Widget build(BuildContext context) {
    final ResponsiveScreenConfig rsc = ResponsiveScreenConfig(context);
    final _emailTextViewController = TextEditingController(
        text: context.read<LoginBloc>().emailAddressString);
    final _passwordTextViewController =
        TextEditingController(text: context.read<LoginBloc>().passwordString);

    bool showEmailErrorMessage = false;
    bool showPasswordErrorMessage = false;

    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginQueryReturn) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) {
            either.fold(
              (failure) {
                return ScaffoldMessenger.of(context).showSnackBar(CrokettSnackbar(
                    text: failure
                        .errorMessage, buttonLabel: Constants.forgotPassword, onPressed: () {nextScreen(FORGOT_PASSWORD);})); //AlertDialog(title: Text(failure.errorMessage));
              },
              (success) {
                nextScreen(HOME);
              },
            );
          },
        );
      }
    }, builder: (context, state) {
      _emailTextViewController.selection = TextSelection.fromPosition(
          TextPosition(offset: _emailTextViewController.text.length));

      _passwordTextViewController.selection = TextSelection.fromPosition(
          TextPosition(offset: _passwordTextViewController.text.length));

      bool buttonEnabled =
          context.watch<LoginBloc>().bottomLoginButtonEnabled ? true : false;

      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  getDeviceType() == DeviceType.Phone ? rsc.rW(10) : rsc.rW(24),
              vertical: UIHelper.paddingBetweenElements),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(height: UIHelper.paddingBetweenElements),
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
                        context.read<LoginBloc>()
                        .add(EmailChanged(emailString: value));
                  },
                  inputType: TextInputType.emailAddress,
                  obscureText: false,
                  validator: (_) {
                    context.watch<LoginBloc>().emailAddress.value.fold(
                      (f) {
                        buttonEnabled = false;
                        showEmailErrorMessage = true;
                      },
                      (_) {
                        showEmailErrorMessage = false;
                      },
                    );
                  },
                  showErrorMessage: showEmailErrorMessage,
                  errorMessage: Constants.emailInformation,
                ),
              ),
              SizedBox(height: UIHelper.paddingBetweenElements),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: CrokettTextField(
                  hint: Constants.password,
                  secondHint: Constants.forgotPassword,
                  secondHintFunction: () {
                    nextScreen(FORGOT_PASSWORD);
                    debugPrint('Forgotten Password');
                  },
                  controller: _passwordTextViewController,
                  onChanged: (value) {
                    _passwordTextViewController.text = value;
                    _passwordTextViewController.selection =
                        TextSelection.fromPosition(TextPosition(
                            offset: _passwordTextViewController.text
                                .length)); // Puts the cursor at the end of the text
                        context.read<LoginBloc>()
                        .add(PasswordChanged(passwordString: value));
                  },
                  inputType: TextInputType.text,
                  obscureText: true,
                  validator: (_) {
                    context.watch<LoginBloc>().password.value.fold(
                      (f) {
                        buttonEnabled = false;
                        showPasswordErrorMessage = true;
                      },
                      (_) {
                        showPasswordErrorMessage = false;
                      },
                    );
                  },
                  showErrorMessage: showPasswordErrorMessage,
                  errorMessage: Constants.passwordInformation,
                ),
              ),
              SizedBox(height: UIHelper.paddingBetweenElements),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: buttonEnabled ? Colors.black : Colors.grey.shade200,
                ),
                onPressed: () {
                  if (buttonEnabled) {
                    context.read<LoginBloc>().add(LoginWithEmailAndPassword(
                        emailString: _emailTextViewController.text,
                        passwordString: _passwordTextViewController.text));
                  }
                  debugPrint('Login pressed');
                },
                child: Text(Constants.logIn,
                    style: TextStyle(
                        color: buttonEnabled ? Colors.white : Colors.grey)),
              ),
              SizedBox(height: UIHelper.paddingBetweenElements),
              Text(
                Constants.notGotAccount,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
              ),
              TextButton(
                onPressed: () {
                  nextScreen(SIGN_UP);
                },
                child: Text(
                  Constants.signUp,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

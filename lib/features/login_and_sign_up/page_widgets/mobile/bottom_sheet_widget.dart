import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/helpers/device_type_helper.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/core/global/helpers/ui_helper.dart';
import 'package:crokett/core/global/widgets/crokett_textfield.dart';
import 'package:crokett/features/login_and_sign_up/blocs/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBottomSheetWidget extends StatefulWidget {
  const LoginBottomSheetWidget({Key? key}) : super(key: key);

  @override
  _LoginBottomSheetWidgetState createState() => _LoginBottomSheetWidgetState();
}

class _LoginBottomSheetWidgetState extends State<LoginBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    final ResponsiveScreenConfig rsc = ResponsiveScreenConfig(context);
    final _emailTextViewController = TextEditingController(text: '');
    final _passwordTextViewController = TextEditingController(text: '');

    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      // if (state is LoggedIn) {
      //     nextScreen(HOME);
      // }
    }, builder: (context, state) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal:
                getDeviceType() == DeviceType.Phone ? rsc.rW(10) : rsc.rW(24),
            vertical: UIHelper.paddingBetweenElements),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(height: UIHelper.paddingBetweenElements),
              CrokettTextField(
                hint: Constants.email,
                controller: _emailTextViewController,
                onChanged: (value) {
                  _emailTextViewController.text = value;
                  _emailTextViewController.selection =
                      TextSelection.fromPosition(TextPosition(
                          offset: _emailTextViewController.text
                              .length)); // Puts the cursor at the end of the text
                },
                inputType: TextInputType.emailAddress,
                obscureText: false,
                validator: (text) {
                  context
                      .read<LoginBloc>()
                      .add(EmailChanged(emailString: text));
                },
              ),
              SizedBox(height: UIHelper.paddingBetweenElements),
              CrokettTextField(
                hint: Constants.password,
                controller: _passwordTextViewController,
                onChanged: (value) {
                  _passwordTextViewController.text = value;
                  _passwordTextViewController.selection =
                      TextSelection.fromPosition(TextPosition(
                          offset: _passwordTextViewController.text
                              .length)); // Puts the cursor at the end of the text
                },
                inputType: TextInputType.text,
                obscureText: true,
                validator: (text) {
                  context
                      .read<LoginBloc>()
                      .add(PasswordChanged(passwordString: text));
                },
              ),
              SizedBox(height: UIHelper.paddingBetweenElements),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {
                  debugPrint('Login pressed');
                },
                child: Text(Constants.logIn),
              ),
              SizedBox(height: UIHelper.paddingBetweenElements),
              Text(
                Constants.notGotAccount,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
              ),
              TextButton(
                onPressed: () {},
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

class SheetButton extends StatefulWidget {
  SheetButton({Key? key}) : super(key: key);

  _SheetButtonState createState() => _SheetButtonState();
}

class _SheetButtonState extends State<SheetButton> {
  bool checkingFlight = false;
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return !checkingFlight
        ? MaterialButton(
            color: Colors.grey[800],
            onPressed: () async {
              setState(() {
                checkingFlight = true;
              });

              await Future.delayed(Duration(seconds: 1));

              setState(() {
                success = true;
              });

              await Future.delayed(Duration(milliseconds: 500));

              Navigator.pop(context);
            },
            child: Text(
              'Check Flight',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        : !success
            ? CircularProgressIndicator()
            : Icon(
                Icons.check,
                color: Colors.green,
              );
  }
}

import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
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
    final _textViewController = TextEditingController(text: '');

    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      // if (state is LoggedIn) {
      //     nextScreen(HOME);
      // }
    }, builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
        height: rsc.rH(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  CrokettTextField(
                    hint: Constants.email,
                    controller: _textViewController,
                    onChanged: (value) {
                      _textViewController.text = value;
                      _textViewController.selection =
                          TextSelection.fromPosition(TextPosition(
                              offset: _textViewController.text
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
                  // SheetButton()
                ],
              ),
            ),
          ],
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

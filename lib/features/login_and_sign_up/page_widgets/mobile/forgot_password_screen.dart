import 'package:crokett/core/global/asset_names.dart/images_and_sounds.dart';
import 'package:crokett/core/global/colors/custom_colours.dart';
import 'package:crokett/core/global/constants/constants.dart';
import 'package:crokett/core/global/helpers/device_type_helper.dart';
import 'package:crokett/core/global/helpers/responsive_screen_helper.dart';
import 'package:crokett/core/global/helpers/ui_helper.dart';
import 'package:crokett/core/global/widgets/crokett_textfield.dart';
import 'package:crokett/features/login_and_sign_up/blocs/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:crokett/routes/crokett_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final Function(String) nextScreen;

  ForgotPasswordScreen({required this.nextScreen}) : super();

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late Function(String) nextScreen; // Will be needed to go back to login screen

  @override
  void initState() {
    super.initState();
    nextScreen = widget.nextScreen;
  }

  @override
  Widget build(BuildContext context) {
    final ResponsiveScreenConfig rsc = ResponsiveScreenConfig(context);
    bool showEmailErrorMessage = false;
    final _emailTextViewController = TextEditingController(
        text: context.read<ForgotPasswordBloc>().emailAddressString);
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) {
      // if (state is GoogleSignInSelected) {
      //     nextScreen(GOOGLE_SIGN_IN);
      //   }
      // if (state is GoBackToLoginScreen) {
      //     nextScreen(SIGN_UP);
      // }
    }, builder: (context, state) {
      bool buttonEnabled =
          context.watch<ForgotPasswordBloc>().bottomLoginButtonEnabled
              ? true
              : false;

      if (state is ForgotPasswordStateInitial ||
          state is EmailTextFieldChanged) {
        return Scaffold(
          backgroundColor: Colors.white,
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                          child: Text(
                            'cr',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        const SizedBox(width: 1),
                        Column(
                          children: [
                            SizedBox(height: 16),
                            Container(
                              height: 32,
                              width: 32,
                              child: RotationTransition(
                                turns: AlwaysStoppedAnimation(52 / 360),
                                child: SvgPicture.asset(Images.imageHobPower2),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 1),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                          child: Text(
                            'kett',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(height: rsc.rH(20)),
                    Text(Constants.enterEmailToResetPassword),
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
                          context
                              .read<ForgotPasswordBloc>()
                              .add(EmailChanged(emailString: value));
                        },
                        inputType: TextInputType.emailAddress,
                        obscureText: false,
                        validator: (_) {
                          context
                              .watch<ForgotPasswordBloc>()
                              .emailAddress
                              .value
                              .fold(
                            (f) {
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:
                            buttonEnabled ? Colors.black : Colors.grey.shade200,
                      ),
                      onPressed: () {
                        context.read<ForgotPasswordBloc>().add(ResetPassword(
                            emailString: context
                                .read<ForgotPasswordBloc>()
                                .emailAddressString));
                      },
                      child: Text(Constants.logIn,
                          style: TextStyle(
                              color:
                                  buttonEnabled ? Colors.white : Colors.grey)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } else if (state is SendingEmailReset) {
        return Container(
          height: rsc.rHP(100),
          width: rsc.rW(100),
          color: Colors.white,
          child: Align(
            child: Center(child: CircularProgressIndicator()),
          ),
        );
      } else if (state is EmailSentConfirmation) {
        return state.emailSentReturn.fold(
          () {
            return Container();
          },
          (either) {
            return either.fold(
              (failure) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: Container(
                    height: rsc.rHP(100),
                    width: rsc.rW(100),
                    child: Center(
                          child: Column(
                        children: [
                          Text(Constants.errorSendingEmail),
                          SizedBox(height: UIHelper.paddingBetweenElements),
                          Text(failure.errorMessage),
                          SizedBox(height: UIHelper.paddingBetweenElements),
                          TextButton(
                            onPressed: () {
                              nextScreen(LOGIN);
                            },
                            child: Text(
                              Constants.backToLogin,
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
                  ),
                );
              },
              (success) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: Container(
                    height: rsc.rHP(100),
                    width: rsc.rW(100),
                    child: Align(
                      child: Center(
                          child: Column(
                        children: [
                          Text(Constants.passwordResetSentToEmail),
                          SizedBox(height: UIHelper.paddingBetweenElements),
                        ],
                      )),
                    ),
                  ),
                );
              },
            );
          },
        );
      } else {
        return Scaffold(
          backgroundColor: CustomColours.crokettYellow,
          body: Container(
            height: rsc.rHP(100),
            width: rsc.rW(100),
            color: CustomColours.crokettYellow,
            child: Align(
              child: Center(
                child: Text(Constants.serverError),
              ),
            ),
          ),
        );
      }
    });
  }
}
